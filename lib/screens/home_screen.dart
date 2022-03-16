import 'package:calculadora_de_imc/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController pesoControle = TextEditingController();
  TextEditingController alturaControle = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person,
                size: 120,
                color: Colors.blue,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (Kg)',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                textAlign: TextAlign.center,
                controller: pesoControle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe seu peso!";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                textAlign: TextAlign.center,
                controller: alturaControle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe sua altura!";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        homeController.calcular(
                          peso: double.parse(pesoControle.text),
                          altura: double.parse(alturaControle.text),
                        );
                      }
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                homeController.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetFields() {
    pesoControle.text = "";
    alturaControle.text = "";
    homeController.value = "Informe seus dados";

    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }
}
