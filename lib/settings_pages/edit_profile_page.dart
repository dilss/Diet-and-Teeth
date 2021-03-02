import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Perfil",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 8,
          color: Colors.cyan.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        enabled: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        enabled: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sobrenome',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        enabled: true,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefone',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(
                        elevation: 5,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Salvar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
