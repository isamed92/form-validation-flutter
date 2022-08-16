import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () {
            //todo guardar producto
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const ProductImage(),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      onPressed: () {
                        //todo camara o galeria
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const _ProductForm(),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', labelText: 'Nombre:'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150.00', labelText: 'Precio:'),
            ),
            const SizedBox(
              height: 30,
            ),
            SwitchListTile.adaptive(
              title: const Text('Disponible'),
              activeColor: Colors.indigo,
              value: true,
              onChanged: (value) {
                //todo pendiente esto
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5)
      ],
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}
