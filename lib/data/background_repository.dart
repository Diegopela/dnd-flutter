import '../models/feat_and_background.dart';

class BackgroundRepository {
  static const List<BackgroundDefinition> all = [
    BackgroundDefinition('acolyte', 'Acólito', 'Refugio de los Fieles',
        'Vos y tus compañeros de aventura podéis recibir alojamiento y comida gratis en templos de tu fe, y contás con el apoyo de sus sacerdotes.'),
    BackgroundDefinition('charlatan', 'Charlatán', 'Identidad Falsa',
        'Tenés una segunda identidad falsa con documentación creíble, y podés falsificar documentos con práctica.'),
    BackgroundDefinition('criminal', 'Criminal', 'Contacto Criminal',
        'Tenés un contacto de confianza que actúa como enlace con una red criminal, y sabés cómo comunicarte en secreto.'),
    BackgroundDefinition('entertainer', 'Artista', 'Por Aclamación Popular',
        'Siempre podés encontrar un lugar gratis para alojarte con gente común dispuesta a esconderte de la ley a cambio de tus actuaciones.'),
    BackgroundDefinition('folk_hero', 'Héroe Popular', 'Hospitalidad Rústica',
        'La gente común te reconoce y te da alojamiento/comida gratis, y te ayuda a esconderte u ocultar tus pertenencias.'),
    BackgroundDefinition('guild_artisan', 'Artesano Gremial', 'Membresía en el Gremio',
        'Sos miembro de un gremio de artesanos; podés alojarte en su sede y contás con contactos comerciales en otras ciudades.'),
    BackgroundDefinition('hermit', 'Ermitaño', 'Descubrimiento',
        'Tu tiempo de aislamiento te reveló una verdad importante o un secreto poco conocido sobre el cosmos, una figura importante, o un misterio local.'),
    BackgroundDefinition('noble', 'Noble', 'Posición de Privilegio',
        'Tu estatus social te abre puertas: sos bienvenido en círculos de alta sociedad y la gente común intenta complacerte.'),
    BackgroundDefinition('outlander', 'Forastero', 'Guía',
        'Recordás perfectamente la geografía del territorio salvaje que recorriste, y podés encontrar comida/agua para vos y hasta 5 personas al viajar.'),
    BackgroundDefinition('sage', 'Sabio', 'Investigador',
        'Cuando no sabés algo, sabés dónde/con quién buscar la información — a menudo una biblioteca, un archivo, un experto, o un sabio similar a vos.'),
    BackgroundDefinition('sailor', 'Marinero', 'Ojo del Marinero',
        'Podés conseguir pasaje gratis en barcos para vos y compañeros a cambio de trabajo, y sabés cómo hablar con la gente de mar.'),
    BackgroundDefinition('soldier', 'Soldado', 'Rango Militar',
        'Los soldados de tu antiguo ejército te reconocen y respetan tu rango; podés convocar favores menores de ellos.'),
    BackgroundDefinition('urchin', 'Golfillo', 'Vagabundo de Ciudad',
        'Conocés los atajos secretos de las ciudades: podés recordar la disposición general de cualquier asentamiento en el que hayas pasado al menos un día, y viajar el doble de rápido entre dos puntos conocidos de una ciudad.'),
  ];

  static BackgroundDefinition? byId(String id) {
    try {
      return all.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }
}
