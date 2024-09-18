import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/view_model/user_view_model.dart';

class AddUserScreen extends ConsumerStatefulWidget {
  const AddUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends ConsumerState<AddUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _ageController = TextEditingController();
    _listenerManual();
  }

  @override
  void dispose() {    
    _idController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //_listener();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Id',
                ),
              ),
        
              const SizedBox(height: 8),
        
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
        
              const SizedBox(height: 8),            
        
              TextFormField(
                controller: _ageController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
              
              const SizedBox(height: 8),
        
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
        
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _addUser, 
                child: const Text('Add User'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addUser() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {

      final user = User(
        id: int.parse(_idController.text),
        username: _nameController.text,
        age: int.parse(_ageController.text),
        email: _emailController.text
      );

      ref.read(userViewModelProvider.notifier).addUser(user);
      
    }
  }

  void _listenerManual() {
    ref.listenManual(userViewModelProvider.select((state) => state.isAdded), (prev, next) {

      if (next) {
        // ref.invalidate(usersProvider);
        // final state = ref.refresh(usersProvider);
        // debugPrint(state.users.toString());
        Navigator.of(context).pop();
      }

    });

    ref.listenManual(userViewModelProvider.select((state) => state.error), (prev, next) {

      if (next != null) {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(next.toString()),
            );
          });
      }

    });
  }

  void _listener() {
    ref.listen(userViewModelProvider.select((state) => state.isAdded), (prev, next) {

      if (next) {
        Navigator.of(context).pop();
      }

    });

    ref.listen(userViewModelProvider.select((state) => state.error), (prev, next) {

      if (next != null) {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(next.toString()),
            );
          });
      }

    });
  }
}
