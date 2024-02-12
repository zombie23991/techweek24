import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techweek24/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.amber,
        ),
      ),
    );
  }

  Widget _buildSectionItem(String leading, String text) {
    return ListTile(
      leading: const Icon(
        Icons.check_circle_outline,
        color: Colors.amber,
      ),
      title: Text(leading, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(text),
    );
  }

  Widget _buildSkillsSection(List<String> skills) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: skills.map((skill) => Chip(
        label: Text(skill),
        avatar: Icon(Icons.star, color: Colors.yellow[700]),
        backgroundColor: Colors.amber.shade100,
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi CV'),
        centerTitle: true,
        actions: [
          // Icono para cambiar el tema oscuro/luminoso
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // Obtener el proveedor de tema
              final provider = Provider.of<ThemeProvider>(context, listen: false);

              // Cambiar el tema y notificar a los escuchantes
              provider.setTheme(provider.getTheme() == ThemeData.dark() ? ThemeData.light() : ThemeData.dark());
            },
          )

        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.amber, // Color de fondo
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/profile.png',
                      fit: BoxFit.cover,
                      height: 120,

                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Adrià Castany Carranza', style: Theme.of(context).textTheme.headlineSmall),
                Text('Desarrollador de Flutter', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[700])),
                const Divider(height: 40, thickness: 2),
                _buildSectionTitle('Información Personal'),
                _buildSectionItem('Email:', 'adriacastany@leviathancreativestudios.com'),
                _buildSectionItem('Teléfono:', '+34 123 456 789'),
                const Divider(height: 40, thickness: 2),
                _buildSectionTitle('Experiencia Profesional'),
                _buildSectionItem('Leviathan Creative Studios, S.L.:', 'Desarrollador de Flutter Octubre 2022 - Presente\nCreo apps mu guapas en Flutter :D'),
                const Divider(height: 40, thickness: 2),
                _buildSectionTitle('Educación'),
                _buildSectionItem('Grado:', 'Grado superior en DAM\nEscola Pia Santa Anna, 2020 - 2022'),
                const Divider(height: 40, thickness: 2),
                _buildSectionTitle('Habilidades'),
                _buildSkillsSection(['Flutter', 'Dart', 'JavaScript', 'HTML & CSS', 'Angular', 'MongoDB', 'PHP']),
              ],
            ),
          ),
          // Aquí puedes añadir más páginas para proyectos, contacto, etc.
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Secciones del CV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Información Personal'),
              onTap: () {
                _pageController.jumpToPage(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Experiencia Profesional'),
              onTap: () {
                _pageController.jumpToPage(1); // Ajustar el índice según la página
              },
            ),
            // Añade más elementos según las secciones de tu CV
          ],
        ),
      ),
    );
  }
}

