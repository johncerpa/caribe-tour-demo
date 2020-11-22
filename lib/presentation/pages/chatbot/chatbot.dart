import 'package:caribe_tour/presentation/pages/cards/cards_introduction.dart';
import 'package:caribe_tour/presentation/pages/chatbot/parameters.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/chatbot/message.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:page_transition/page_transition.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatBotState createState() => _ChatBotState();
}

/// Esta clase es la vista con la cual el usuario interactua con el [ChatBot].
class _ChatBotState extends State<ChatBot> {
  ///Esta variable contiene la lista de los mensajes que se muestran en pantalla, tanto los del [usuario] como los del [ChatBot].
  final List<Message> messageList = <Message>[];

  ///En esta varible se guardan los parametros que el [ChatBot] le pide al usuario para posteriormente usarla en la navegación y creación de planes .
  ParametersStart _parametersStart;

  final TextEditingController _textController = TextEditingController();

  /// Este metodo controla y muestra la barra en la cual el usuario introduce el texto e interactúa con el [ChatBot].
  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: const InputDecoration.collapsed(hintText: "Escribe tu mensaje..."),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: kSecondaryDarkerColor,
                ),
                onPressed: () => _submitQuery(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Este metodo asincrónico  que maneja las respuestas del [Agente] que no es mas que una instancia del [Chatbot].
  void agentResponse(String query) async {
    _textController.clear();

    ///Esta variable se encarga de autenticarse con la consola de GCP de google, utilizando un archivo json que se encuentra en la carpeta assets,
    ///este contiene toda la información necesaria para realizar la autentificación
    final authGoogle = await AuthGoogle(
      fileJson: "assets/Karib.json",
    ).build();

    /// Esta variable guarda el chatbot .
    final dialogFlow = Dialogflow(
      authGoogle: authGoogle,

      ///El lenguaje es establecido dependiendo del que el usuario tenga seleccionado para su dispositivo.
      language: context.locale.languageCode == 'es' ? Language.spanish : Language.english,
    );

    /// Con este método obtenemos la intención del usuario según lo identifique el agente.
    final response = await dialogFlow.detectIntent(query);

    /// En esta variable se guarda la respuesta, como texto legible para humanos, para posteriormente mostrarse en pantalla
    final message = Message(
      text: response.getMessage() ?? "No recibí respuesta del servidor",
      name: "Flutter",
      type: false,
    );

    setState(() {
      /// Se inserta el mensaje a la lista de mensajes a mostrar.
      messageList.insert(0, message);

      checkForRouting(response);
    });
  }

  /// Este método revisa la respuesta del agente e identifica si es necesario realizar una transición de ventanas
  /// y realizar una busqueda filtrada con los [parametros] identificados dentro del mensaje del usuario.
  void checkForRouting(AIResponse response) {
    switch (response.getIntent()) {
      case "create.plan.start - details":
        {
          if (response.queryResult.allRequiredParamsPresent != null) {
            Navigator.push(
              context,
              PageTransition(
                child: CardsIntroduction(
                  cities: [],
                  departments: _parametersStart.departamentos,
                  byDepartments: true,
                  forKidsFilter: _hasChildren(response.getParameters()),
                  disabilitiesFilter: _hasDisabled(response.getParameters()),
                  daysAvailable: _parametersStart.dias,
                ),
                type: PageTransitionType.rightToLeft,
              ),
            );
          }
        }
        break;
      case "create.plan.start":
        {
          if (response.queryResult.allRequiredParamsPresent != null) {
            _parametersStart = ParametersStart.fromJson(response.getParameters());
          }
        }
        break;
    }
  }

  /// Este método recorre los [parámetros] e identifica si tienen menores de edad entre las personas que realizarán el viaje.
  bool _hasChildren(parameters) {
    for (final parametro in parameters['viajeros']) {
      if (parametro == "Menor de edad") {
        return true;
      }
    }
    return false;
  }

  /// Este método recorre los [parámetros] e identifica si tienen personas con discapacidad entre los viajeros.
  bool _hasDisabled(parameters) {
    for (final parametro in parameters['viajeros']) {
      if (parametro == "Discapacitado") {
        return true;
      }
    }
    return false;
  }

  /// Este método toma el input del usuario y lo agrega a la lista de mensajes, posteriormente le envía este mensaje al agente
  /// para que este realice su analisis.
  void _submitQuery(String text) {
    _textController.clear();

    final message = Message(
      text: text,
      name: "User",
      type: true,
    );

    setState(() {
      messageList.insert(0, message);
    });

    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            SizedBox(
              height: 30,
              width: 30,
              child: FlareActor(
                "assets/images/Loading.flr",
                animation: "active",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Mokaná",
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        brightness: Brightness.light,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => messageList[index],
              itemCount: messageList.length,
            ),
          ),
          _queryInputWidget(context),
        ],
      ),
    );
  }
}
