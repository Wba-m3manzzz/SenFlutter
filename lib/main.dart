import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Login & Signup',
      routerConfig: _goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              FlexColorScheme.createPrimarySwatch(const Color(0xFF3ddc84)),
          accentColor: const Color(0xFF3ddc84),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              FlexColorScheme.createPrimarySwatch(const Color(0xFF3ddc84)),
          accentColor: const Color(0xFF3ddc84),
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigate to the ProductListPage on successful login
                    GoRouter.of(context).go('/productList');
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/signup');
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Perform signup
                  }
                },
                child: const Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // Dummy product data for testing
  final List<Product> products = List.generate(
    20,
    (index) =>
        Product(index + 1, 'Product ${index + 1}', (index + 1) * 10000000.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${products[index].id}. ${products[index].name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
                Text('Price: Rp. ${products[index].price.toStringAsFixed(0)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // TODO: Implement product deletion logic
                setState(() {
                  products.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

final GoRouter _goRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (context, state) {
      return LoginPage();
    },
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) {
      return SignupPage();
    },
  ),
  GoRoute(
    path: "/productList",
    builder: (context, state) {
      return ProductListPage();
    },
  ),
]);
