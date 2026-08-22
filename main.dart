import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/character_provider.dart';
import 'storage/character_storage.dart';
import 'ui/theme/app_theme.dart';
import 'ui/screens/character_list_screen.dart';
import 'ui/screens/character_form_screen.dart';
import 'ui/screens/skill_bar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = CharacterStorage();
  await storage.init();
  runApp(DndBarApp(storage: storage));
}

class DndBarApp extends StatelessWidget {
  final CharacterStorage storage;
  const DndBarApp({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CharacterProvider(storage),
      child: MaterialApp(
        title: 'DnD Skill Bar',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: const RootNavigator(),
      ),
    );
  }
}

/// Navegación simple con un Navigator manual (equivalente al NavHost de Compose).
class RootNavigator extends StatefulWidget {
  const RootNavigator({super.key});

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => _buildList());
      },
    );
  }

  Widget _buildList() {
    return CharacterListScreen(
      onOpenCharacter: (id) {
        _navKey.currentState!.push(
          MaterialPageRoute(builder: (_) => _buildSkillBar(id)),
        );
      },
      onCreateCharacter: () {
        _navKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => CharacterFormScreen(
              existingCharacter: null,
              onSaved: (newId) {
                // Reemplaza la pantalla de creación por la hoja del personaje
                // (crear personaje entra directo a la barra de habilidades).
                _navKey.currentState!.pushReplacement(
                  MaterialPageRoute(builder: (_) => _buildSkillBar(newId)),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillBar(String characterId) {
    return SkillBarScreen(
      characterId: characterId,
      onBack: () => _navKey.currentState!.pop(),
      onEdit: (id) {
        _navKey.currentState!.push(
          MaterialPageRoute(
            builder: (context) => CharacterFormScreenFromProvider(
              characterId: id,
              onSaved: (_) => Navigator.of(context).pop(),
            ),
          ),
        );
      },
    );
  }
}
