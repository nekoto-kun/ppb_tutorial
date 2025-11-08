import 'package:flutter/material.dart';
import 'package:myapp/helpers/validator_helper.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  String? _selectedGender;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _resetForm() {
     _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _selectedGender = null;
      _agreeToTerms = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputEmailForm(emailController: _emailController),
            InputPasswordForm(passwordController: _passwordController),
            InputNameForm(nameController: _nameController),
            DropdownButtonFormField<String>(
              initialValue: _selectedGender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'male', child: Text('Male')),
                DropdownMenuItem(value: 'female', child: Text('Female')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Gender is required';
                }
                return null;
              }
            ),
            SubmitFormButton(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              nameController: _nameController,
              resetForm: _resetForm,
            ),
          ],
        ),
      ),
    );
  }
}

class InputNameForm extends StatelessWidget {
  const InputNameForm({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Full Name',
        hintText: 'John Doe',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Full name is required';
        }

        return null;
      },
    );
  }
}

class InputPasswordForm extends StatelessWidget {
  const InputPasswordForm({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Minimum 8 characters',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    );
  }
}

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
    required void Function() resetForm,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController,
       _nameController = nameController,
       _resetForm = resetForm;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _nameController;
  final void Function() _resetForm;

  void _processSignUp(Map<String, dynamic> formData, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Successful'),
          content: Text('Welcome, ${formData['name']}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Reset form
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });

    _resetForm();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FocusScope.of(context).unfocus();

        if (!_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fix the errors above.'),
              backgroundColor: Colors.red,
            ),
          );

          return;
        }

        _formKey.currentState!.save();

        final formData = {
          'email': _emailController.text.trim(),
          'password': _passwordController.text,
          'name': _nameController.text.trim(),
        };

        // Proses data
        _processSignUp(formData, context);
      },
      child: const Text('Create Account'),
    );
  }
}

class InputEmailForm extends StatelessWidget {
  const InputEmailForm({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'example@domain.com',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      validator: ValidatorHelper.email,
    );
  }
}
