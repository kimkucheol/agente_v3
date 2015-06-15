unit unttranslate;

interface

var
  ID_LANG: Integer;

const
  MAX_LANGUAGES = 3;
  APP_NAME: array[0..(MAX_LANGUAGES - 1)] of String = ('Hosanna Agente 3.0',
                                                       'Hosanna Agent 3.0',
                                                       'Hosanna Agente 3.0');

  APP_EVENT_TYPE_LOGOFF     : array[0..(MAX_LANGUAGES - 1)] of String = ('Logoff',
                                                                         'Logoff',
                                                                         'Cierre de sesión');

  APP_EVENT_TYPE_PAUSE      : array[0..(MAX_LANGUAGES - 1)] of String = ('Pausa',
                                                                         'Pause',
                                                                         'Pausa');

  APP_EVENT_TYPE_CHANGEPAUSE: array[0..(MAX_LANGUAGES - 1)] of String = ('Trocapausa',
                                                                         'Changepause',
                                                                         'Cambio de Pausa');

  APP_EVENT_TYPE_UNPAUSE    : array[0..(MAX_LANGUAGES - 1)] of String = ('Despausa',
                                                                         'Unpause',
                                                                         'Despausa');

  APP_PAUSE_TYPE_LOGIN      : array[0..(MAX_LANGUAGES - 1)] of String = ('Login',
                                                                         'Login',
                                                                         'Iniciar sesión');

  APP_PAUSE_TYPE_AFTER_HU   : array[0..(MAX_LANGUAGES - 1)] of String = ('Pos Atendimento',
                                                                         'After Answer',
                                                                         'Pos Atención');

//Application.MessageBox
  APP_MB_APP_ALREADY_RUNNING     : array[0..(MAX_LANGUAGES - 1)] of String = ('000 - A aplicação já está sendo executada.',
                                                                              '000 - The application is already running.',
                                                                              '000 - La aplicación yá se está ejecutando.');

  APP_MB_ERR_ENABLE_EXTEN        : array[0..(MAX_LANGUAGES - 1)] of String = ('001 - Erro ao ativar o Ramal.',
                                                                              '001 - Error activating Extension.',
                                                                              '001 - Error en la activación de Extensión.');

  APP_MB_ERR_OPEN_LINE           : array[0..(MAX_LANGUAGES - 1)] of String = ('002 - Erro ao abrir a linha.',
                                                                              '002 - Error opening the line.',
                                                                              '002 - Error al abrir la línea.');

  APP_MB_ERR_LOGIN_NEEDED        : array[0..(MAX_LANGUAGES - 1)] of String = ('003 - É necessário estar logado para efetuar uma discagem.',
                                                                              '003 - You need be logged to make a call.',
                                                                              '003 - Debe estar conectado para hacer una llamada.');

  APP_MB_ERR_INSERT_DIALNUMBER   : array[0..(MAX_LANGUAGES - 1)] of String = ('004 - Favor preencher o número para discagem.',
                                                                              '004 - Please fill the number to dial.',
                                                                              '004 - Por favor, rellene el siguiente número para marcar.');

  APP_MB_WAR_PAUSE_LOGIN_MSG_1   : array[0..(MAX_LANGUAGES - 1)] of String = ('005 - Em ',
                                                                              '005 - In ',
                                                                              '005 - En ');

  APP_MB_WAR_PAUSE_LOGIN_MSG_2   : array[0..(MAX_LANGUAGES - 1)] of String = (' segundos você estará disponível!',
                                                                              ' seconds you will be available!',
                                                                              ' segundos que Usted estará disponible!');

  APP_MB_WAR_CLASSIFICATION_MSG_1: array[0..(MAX_LANGUAGES - 1)] of String = ('006 - Você tem ',
                                                                              '006 - You have ',
                                                                              '006 - Usted tiene ');

  APP_MB_WAR_CLASSIFICATION_MSG_2: array[0..(MAX_LANGUAGES - 1)] of String = (' segundos para classificar esta ligação!',
                                                                              ' seconds to classify this call!',
                                                                              ' segundos para clasificar esta llamada!');

  APP_MB_WAR_ROOT_LOGGEDOUT      : array[0..(MAX_LANGUAGES - 1)] of String = ('007 - Você foi deslogado pelo supervisor.' + #13 + 'O Agente será finalizado.',
                                                                              '007 - You Logged Out By The Supervisor.' + #13 + 'The Agent will be closed.',
                                                                              '007 - Usted ha sido desconectado por el supervisor .' + #13 +  'El agente se finalizará.');

  APP_MB_WAR_USER_AVAILABLE      : array[0..(MAX_LANGUAGES - 1)] of String = ('008 - Você não selecionou uma Pausa válida.' + #13 + 'Este Agente esta disponível novamente!',
                                                                              '008 - You not selected a valid Pause.' + #13 + 'This Agent is available again!', 
                                                                              '008 - Usted no ha seleccionado una pausa válida.' + #13 + 'Este agente se encuentra disponible nuevamente!');

  APP_MB_WAR_CANNOT_CLOSE        : array[0..(MAX_LANGUAGES - 1)] of String = ('009 - Não é permitido fechar o sistema enquanto o Agente estiver logado.',
                                                                              '009 - You cannot close the application while Agent is logged.',
                                                                              '009 - No se puede cerrar la aplicación, mientras el Agente se registra.');

  APP_MB_ERR_FILL_FIELDS         : array[0..(MAX_LANGUAGES - 1)] of String = ('010 - Favor Preencher Corretamente os campos.',
                                                                              '010 - Please fill the fields correctly.',
                                                                              '010 - Por favor, rellene correctamente los campos.');

  APP_MB_ERR_NO_QUEUES_FOUND     : array[0..(MAX_LANGUAGES - 1)] of String = ('011 - Este Agente não faz parte de nenhuma fila.' + #13 + 'Entre em contato com seu supervisor.',
                                                                              '011 - This Agent is not associated at a queue.' + #13 + 'Please contact your supervisor.',
                                                                              '011 - El agente no hace parte de ninguna  cola.' + #13 + 'Póngase en contacto con su supervisor.');

  APP_MB_ERR_INVALID_LOGIN       : array[0..(MAX_LANGUAGES - 1)] of String = ('012 - Login Inválido.' + #13 + 'Tente Novamente.',
                                                                              '012 - Invalid Login.' + #13 + 'Try Again.',
                                                                              '012 - El Login no es valido.' + #13 + 'Intente nuevamente.');

  APP_MB_ERR_INVALID_DB_MSG_1    : array[0..(MAX_LANGUAGES - 1)] of String = ('013 - Não foi possível conectar à base de dados em ',
                                                                              '013 - Failed to connect to database in ',
                                                                              '013 - No se pudo conectar a la base de datos en ');

  APP_MB_ERR_INVALID_DB_MSG_2    : array[0..(MAX_LANGUAGES - 1)] of String = ('.' + #13 + 'Deseja configurar novo IP?',
                                                                              '.' + #13 + 'Do you want to set a new IP?',
                                                                              '.' + #13 + 'Quieres establecer un nuevo IP?');

  APP_MB_WAR_CANNOT_CHANGE_PAUSE : array[0..(MAX_LANGUAGES - 1)] of String = ('014 - Você não pode mais tirar esse tipo de pausa.',
                                                                              '014 - You cannot remove this type of pause anymore.',
                                                                              '014 - usted no puede sacar esto tipo de pausa.');

  APP_MB_WAR_SELECT_PAUSE        : array[0..(MAX_LANGUAGES - 1)] of String = ('015 - Favor escolher o tipo da pausa.',
                                                                              '015 - Please choose the pause type.',
                                                                              '015 - Por favor escoja el tipo de pausa.');

  APP_MB_WAR_SELECT_XFER         : array[0..(MAX_LANGUAGES - 1)] of String = ('016 - Favor escolher o destino da tranferência.',
                                                                              '016 - Please choose the transfer destination.',
                                                                              '016 - Por favor escoja el destino de la transferencia.');

  APP_MB_ERR_INVALID_PASS        : array[0..(MAX_LANGUAGES - 1)] of String = ('017 - As senhas digitadas não coincidem.' + #13 + 'Tente Novamente.',
                                                                              '017 - The passwords you typed do not match.' + #13 + 'Try Again.',
                                                                              '017 - ....' + #13 + 'Intente nuevamente.');

  APP_MB_PASS_CHANGED            : array[0..(MAX_LANGUAGES - 1)] of String = ('018 - Senha alterada com sucesso!',
                                                                              '018 - Password changed with success!',
                                                                              '018 - ...!');

  APP_MB_ERR_PASS_CHANGE         : array[0..(MAX_LANGUAGES - 1)] of String = ('019 - Erro ao trocar senha.' + #13 + 'Tente Novamente.',
                                                                              '019 - Error changing password.' + #13 + 'Try Again.',
                                                                              '019 - ....' + #13 + 'Intente nuevamente.');

  APP_MB_ERR_INVALID_OLD_PASS    : array[0..(MAX_LANGUAGES - 1)] of String = ('020 - Senha anterior Inválida.' + #13 + 'Tente Novamente.',
                                                                              '020 - Invalid Old Password.' + #13 + 'Try Again.',
                                                                              '020 - ....' + #13 + 'Intente nuevamente.');

  APP_MB_ERR_NO_PAUSES_FOUND     : array[0..(MAX_LANGUAGES - 1)] of String = ('021 - Este Agente não possui nenhuma pausa configurada.' + #13 + 'Entre em contato com seu supervisor.',
                                                                              '021 - ...' + #13 + '...',
                                                                              '021 - ...' + #13 + '...');

  APP_MB_ERR_NO_CLASSIF_FOUND    : array[0..(MAX_LANGUAGES - 1)] of String = ('022 - Este Agente não possui nenhum tipo de classificação configurada.' + #13 + 'Entre em contato com seu supervisor.',
                                                                              '022 - ...' + #13 + '...',
                                                                              '022 - ...' + #13 + '...');

  APP_MB_ERR_HAS_PAUSE_RESTRICT  : array[0..(MAX_LANGUAGES - 1)] of String = ('023 - Este Agente está em Pausa Restritiva.' + #13 + 'Entre em contato com seu supervisor.',
                                                                              '023 - ...' + #13 + '...',
                                                                              '023 - ...' + #13 + '...');

  APP_MB_APP_TYPE_SRV_IP         : array[0..(MAX_LANGUAGES - 1)] of String = ('024 - Por favor, digite o novo endereço IP do servidor: ',
                                                                              '024 - ...',
                                                                              '024 - ...');

  APP_MB_ERR_INVALID_LOGIN_UNLOCK: array[0..(MAX_LANGUAGES - 1)] of String = ('025 - Login inválido durante o desbloqueio.' + #13 + 'Tente novamente.',
                                                                              '025 - ...',
                                                                              '025 - ...');

  APP_MB_ASK_CANCEL_UNLOCK       : array[0..(MAX_LANGUAGES - 1)] of String = ('026 - Deseja cancelar o desbloqueio e fechar a aplicação?' + #13 + 'Atenção: Esta opção é válida somente para Supervisores.',
                                                                              '026 - ....' + #13 + '... .',
                                                                              '026 - ....' + #13 + '... .');

  APP_MB_WAR_SELECT_COACHING     : array[0..(MAX_LANGUAGES - 1)] of String = ('027 - Favor escolher o consultor do Coaching.',
                                                                              '027 - ...',
                                                                              '027 - ...');

  APP_MB_ASK_HANGUP_CHAT         : array[0..(MAX_LANGUAGES - 1)] of String = ('028 - Deseja encerrar este Chat?',
                                                                              '028 - ....' + #13 + '... .',
                                                                              '028 - ....' + #13 + '... .');

//procedure Mensagem(str_mensagem: String);
  APP_MB_ERR_OPEN_RTP_PORT       : array[0..(MAX_LANGUAGES - 1)] of String = ('040 - Não foi possível abrir a porta RTP.',
                                                                              '040 - Cannot open RTP port.',
                                                                              '040 - No fue posible abrir la puerta RTP.');

  APP_MB_WAR_USER_PAUSED         : array[0..(MAX_LANGUAGES - 1)] of String = ('041 - Agente em Pausa Restritiva.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '041 - Agent is in a restrictive pause.' + #13 + 'Please contact your supervisor.',
                                                                              '041 - Agente en pausa Restrictiva.' + #13 + 'Póngase en contacto con su supervisor.');

  APP_MB_WAR_NOT_CLASSIFIED      : array[0..(MAX_LANGUAGES - 1)] of String = ('042 - Ligação não classificada.',
                                                                              '042 - Call not classified.',
                                                                              '042 - Llamada no clasificada.');

  APP_MB_WAR_SELECT_NUMBER       : array[0..(MAX_LANGUAGES - 1)] of String = ('043 - Por favor escolha um número.',
                                                                              '043 - Please choose the number.',
                                                                              '043 - Por favor escoja el número.');

  APP_MB_ERR_OPEN_SIP_PORT       : array[0..(MAX_LANGUAGES - 1)] of String = ('044 - Não foi possível abrir a porta SIP.',
                                                                              '044 - Cannot open SIP port.',
                                                                              '044 - No fue posible abrir la puerta SIP.');

  APP_MB_ERR_PAUSE_EXCEEDED_MSG_1: array[0..(MAX_LANGUAGES - 1)] of String = ('045 - Quantidade de Pausa ',
                                                                              '045 - Pause count ',
                                                                              '045 - Cantidad de Pausa ');

  APP_MB_ERR_PAUSE_EXCEEDED_MSG_2: array[0..(MAX_LANGUAGES - 1)] of String = (' excedida.' + #13 + 'Liberadas: ',
                                                                              ' exceeded.' + #13 + 'Free to use: ',
                                                                              ' excedida.' + #13 + 'Liberadas: ');

  APP_MB_ERR_PAUSE_EXCEEDED_MSG_3: array[0..(MAX_LANGUAGES - 1)] of String = (#13 + 'Efetuadas: ',
                                                                              #13 + 'Performed: ',
                                                                              #13 + 'Hechas: ');

  APP_MB_ERR_GENERATED           : array[0..(MAX_LANGUAGES - 1)] of String = ('046 - O sistema gerou um log de erro!',
                                                                              '046 - The system generated a error log!',
                                                                              '046 - El sistema generó un log de error!');

  APP_MB_ERR_CANNOT_DIAL         : array[0..(MAX_LANGUAGES - 1)] of String = ('047 - Discagem não permitida nesse momento.',
                                                                              '047 - Dialing cannot be made at this moment.',
                                                                              '047 - No es permitido marcar en eso momento.');

  APP_MB_ERR_CANNOT_PAUSE        : array[0..(MAX_LANGUAGES - 1)] of String = ('048 - Pausa não permitida durante o atendimento.',
                                                                              '048 - Pause cannot be made during call.',
                                                                              '048 - No se permite pausa mientras el atendimento.');

  APP_MB_ERR_CANNOT_UNPAUSE      : array[0..(MAX_LANGUAGES - 1)] of String = ('049 - Ligação em Andamento.' + #13 + 'Aguarde o final da ligação antes de sair de pausa.',
                                                                              '049 - Call in progress.' + #13 + 'Wait for the end of call to unpause.',
                                                                              '049 - Llamada en curso.' + #13 + 'Espere el final de la llamada antes de salir de la pausa.');

  APP_MB_ERR_PLEASE_CLASSIFY     : array[0..(MAX_LANGUAGES - 1)] of String = ('050 - Ligação não classificada.' + #13 + 'É necessário classificar a ligação antes de sair de pausa.',
                                                                              '050 - Call not classified.' + #13 + 'You need to classify the call before unpause.',
                                                                              '050 - Llamada no clasificada.' + #13 + 'Usted necesita clasificar la llamada antes de salir de la pausa.');

  APP_MB_WAR_ALREADY_CLASSIFIED  : array[0..(MAX_LANGUAGES - 1)] of String = ('051 - Ligação já classificada.',
                                                                              '051 - Call already classified.',
                                                                              '051 - Llamada yá clasificada.');

  APP_MB_WAR_PLEASE_FILL         : array[0..(MAX_LANGUAGES - 1)] of String = ('052 - Favor preencher os seguintes dados:'+ #13,
                                                                              '052 - Please fill the following informations:' + #13,
                                                                              '052 - Por favor, rellene los siguientes datos:' + #13);

  APP_MB_ERR_CANNOT_XFER         : array[0..(MAX_LANGUAGES - 1)] of String = ('053 - Nenhuma Ligação em Andamento.' + #13 + 'Não foi possível efetuar a transferência da ligação.',
                                                                              '053 - No call in progress.' + #13 + 'Cannot transfer the call.',
                                                                              '053 - Ninguna llamada en curso.' + #13 + 'No fue posible hacer la transferencia de la llamada.');

  APP_MB_ERR_WAIT_END_PAUSE      : array[0..(MAX_LANGUAGES - 1)] of String = ('054 - Pausa em andamento.' + #13 + 'É necessário aguardar o tempo mínimo desta pausa.',
                                                                              '054 - Pause in progress.' + #13 + 'You need to wait a minimum time of this pause.',
                                                                              '054 - ....' + #13 + '....');


  APP_MB_WAR_AGENT_IN_CHAT       : array[0..(MAX_LANGUAGES - 1)] of String = ('055 - Agente em Chat.' + #13 + 'É necessário aguardar a finalização do Chat.',
                                                                              '055 - ....' + #13 + '....',
                                                                              '055 - ....' + #13 + '....');

  APP_MB_WAR_CHAT_ALREADY_CLASSIF: array[0..(MAX_LANGUAGES - 1)] of String = ('056 - Chat já classificado.',
                                                                              '056 - ....',
                                                                              '056 - ....');

  APP_MB_WAR_INVALID_VERSION     : array[0..(MAX_LANGUAGES - 1)] of String = ('057 - A versão desta aplicação não é a versão oficial de produção.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '057 - ....',
                                                                              '057 - ....');

  APP_MB_ERR_INVALID_VERSION     : array[0..(MAX_LANGUAGES - 1)] of String = ('058 - A versão desta aplicação não é a versão oficial de produção e será fechada.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '058 - ....',
                                                                              '058 - ....');

  APP_MB_WAR_PAUSE_AGENT_IN_CHAT : array[0..(MAX_LANGUAGES - 1)] of String = ('059 - Agente em Chat.' + #13 + 'Você entrará em Pausa logo que todos os Chats forem finalizados.',
                                                                              '059 - ....' + #13 + '....',
                                                                              '059 - ....' + #13 + '....');

  APP_MB_ERR_CANNOT_CONF_NOCALL  : array[0..(MAX_LANGUAGES - 1)] of String = ('060 - Nenhuma Ligação em Andamento.' + #13 + 'Não foi possível executar a conferência.',
                                                                              '060 - No call in progress.' + #13 + 'Cannot make a conference.',
                                                                              '060 - Ninguna llamada en curso.' + #13 + 'No fue posible hacer la ... .');

  APP_MB_ERR_CANNOT_CONF_NONUMBER: array[0..(MAX_LANGUAGES - 1)] of String = ('061 - Nenhum destino selecionado.' + #13 + 'Não foi possível executar a conferência.',
                                                                              '061 - ....' + #13 + '... .',
                                                                              '061 - ....' + #13 + '... .');

  APP_MB_ERR_ALREADY_LOGGED      : array[0..(MAX_LANGUAGES - 1)] of String = ('062 - Este Agente já está logado em outra estação de trabalho.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '062 - ....',
                                                                              '062 - ....');

  APP_MB_ERR_VIDEO_CODEC         : array[0..(MAX_LANGUAGES - 1)] of String = ('063 - Codec de video padrão não encontrado.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '063 - ....',
                                                                              '063 - ....');

  APP_MB_ERR_AUDIO_CODEC         : array[0..(MAX_LANGUAGES - 1)] of String = ('064 - Codec de audio padrão não encontrado.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '064 - ....',
                                                                              '064 - ....');

  APP_MB_ERR_CANNOT_CONS_NOCALL  : array[0..(MAX_LANGUAGES - 1)] of String = ('065 - Nenhuma Ligação em Andamento.' + #13 + 'Não foi possível executar a consulta.',
                                                                              '065 - ...',
                                                                              '065 - ...');

  APP_MB_ERR_CANNOT_CONS_NONUMBER: array[0..(MAX_LANGUAGES - 1)] of String = ('066 - Nenhum destino selecionado.' + #13 + 'Não foi possível executar a consulta.',
                                                                              '066 - ....' + #13 + '... .',
                                                                              '066 - ....' + #13 + '... .');

  APP_MB_ERR_CANNOT_XFER_NOCALL  : array[0..(MAX_LANGUAGES - 1)] of String = ('067 - Nenhuma Ligação em Andamento.' + #13 + 'Não foi possível executar a transferência.',
                                                                              '067 - ...',
                                                                              '067 - ...');

  APP_MB_ERR_CANNOT_XFER_NONUMBER: array[0..(MAX_LANGUAGES - 1)] of String = ('068 - Nenhum destino selecionado.' + #13 + 'Não foi possível executar a transferência.',
                                                                              '068 - ....' + #13 + '... .',
                                                                              '068 - ....' + #13 + '... .');

  APP_MB_ERR_CANNOT_NAVIGATE     : array[0..(MAX_LANGUAGES - 1)] of String = ('069 - Erro ao chamar URL do Integrador.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '069 - ....' + #13 + '... .',
                                                                              '069 - ....' + #13 + '... .');

  APP_MB_ERR_THREADCREATE_CAPTURE: array[0..(MAX_LANGUAGES - 1)] of String = ('070 - Erro ao mover arquivos de captura de video.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '070 - ....',
                                                                              '070 - ....');

  APP_MB_ERR_THREADCREATE_INTEGRA: array[0..(MAX_LANGUAGES - 1)] of String = ('071 - Erro ao criar thread para o Integrador.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '071 - ....',
                                                                              '071 - ....');

  APP_MB_ERR_THREADEXEC_INTEGRA  : array[0..(MAX_LANGUAGES - 1)] of String = ('072 - Erro ao executar thread para o Integrador.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '072 - ....',
                                                                              '072 - ....');

  APP_MB_APP_DLL_NOT_FOUND       : array[0..(MAX_LANGUAGES - 1)] of String = ('073 - A DLL de Idiomas não foi encontrada',
                                                                              '073 - ....',
                                                                              '073 - ....');

  APP_MB_APP_ERR_REC_SCREEN_CON  : array[0..(MAX_LANGUAGES - 1)] of String = ('074 - Erro ao conectar-se ao servidor de captura de video.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '074 - ....',
                                                                              '074 - ....');

  APP_MB_APP_ERR_REC_SCREEN_DCON : array[0..(MAX_LANGUAGES - 1)] of String = ('075 - Erro ao desconectar-se do servidor de captura de video.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '075 - ....',
                                                                              '075 - ....');

  APP_MB_APP_ERR_REC_SCREEN_SEND : array[0..(MAX_LANGUAGES - 1)] of String = ('076 - Erro ao solicitar captura de video ao servidor.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                              '076 - ....',
                                                                              '076 - ....');

  APP_MB_WAR_PLEASE_FILL_CORRECT : array[0..(MAX_LANGUAGES - 1)] of String = ('077 - Favor preencher com uma Data/Hora superior a atual.',
                                                                              '077 - ....',
                                                                              '077 - ....');

  APP_MB_WAR_PLEASE_FILL_QUALITY : array[0..(MAX_LANGUAGES - 1)] of String = ('078 - Favor selecionar uma qualidade para a chamada.',
                                                                              '078 - ....',
                                                                              '078 - ....');

{  APP_MB_APP_ERR_SCHEDULE_LOGIN  : array[0..(MAX_LANGUAGES - 1)] of String = ('079 - .',
                                                                              '079 - ....',
                                                                              '079 - ....');}

//VAX Messages
  APP_MB_VAX_ERR_NOT_CONNECTED      : array[0..(MAX_LANGUAGES - 1)] of String = ('170 - Você não está conectado.',
                                                                                 '170 - You are not connected.',
                                                                                 '170 - Usted no está conectado.');

  APP_MB_VAX_ERR_OPEN_PORT          : array[0..(MAX_LANGUAGES - 1)] of String = ('171 - Não foi possível abrir a porta de transporte local.',
                                                                                 '171 - Cann`t open local communication port.',
                                                                                 '171 - No fue posible abrir la puerta del transporte local.');

  APP_MB_VAX_ERR_INVALID_LICENCE    : array[0..(MAX_LANGUAGES - 1)] of String = ('172 - Licença inválida.',
                                                                                 '172 - Invalid License Key.',
                                                                                 '172 - Licencia no válida.');

  APP_MB_VAX_ERR_OPEN_WINDOW        : array[0..(MAX_LANGUAGES - 1)] of String = ('173 - Falha ao iniciar janela.',
                                                                                 '173 - Fail to initialize task window.',
                                                                                 '173 - Error al iniciar la ventana.');

  APP_MB_VAX_ERR_MIC_NOT_FOUND      : array[0..(MAX_LANGUAGES - 1)] of String = ('174 - Microfone não encontrado.',
                                                                                 '174 - Cann`t access Input/Mic device or device is already in use.',
                                                                                 '174 - El micrófono no encontrado.');

  APP_MB_VAX_ERR_SOUND_NOT_FOUND    : array[0..(MAX_LANGUAGES - 1)] of String = ('175 - Dispositivo de saída de audio não encontrado.',
                                                                                 '175 - Cann`t access Output/Speaker device or device is already in use.',
                                                                                 '175 - Dispositivo de salida de audio no se encuentra.');

  APP_MB_VAX_ERR_MIC                : array[0..(MAX_LANGUAGES - 1)] of String = ('176 - Microfone com erro.',
                                                                                 '176 - Input/Mic device is not open.',
                                                                                 '176 - Micrófono con error.');

  APP_MB_VAX_ERR_SOUND              : array[0..(MAX_LANGUAGES - 1)] of String = ('177 - Dispositivo de saída de áudio não está disponível.',
                                                                                 '177 - Output/Speaker device is not open.',
                                                                                 '177 - Dispositivo de salida de audio no está disponible.');

  APP_MB_VAX_ERR_VOL_MIC            : array[0..(MAX_LANGUAGES - 1)] of String = ('178 - Dispositivo de áudio não suporta Controle de Volume do Microfone.',
                                                                                 '178 - Fail to access the Mic/Input device Volume OR Sound device does not support Mic volume feature.',
                                                                                 '178 - Dispositivo de audio no es compatible con control de volumen del micrófono.');

  APP_MB_VAX_ERR_VOL_SOUND          : array[0..(MAX_LANGUAGES - 1)] of String = ('179 - Dispositivo de áudio não suporta Controle de Volume de Saída.',
                                                                                 '179 - Fail to access the Speaker/Output device Volume OR Sound device does not support Speaker volume feature.',
                                                                                 '179 - Dispositivo de audio no es compatible con el control del volumen de salida.');

  APP_MB_VAX_ERR_START_REC          : array[0..(MAX_LANGUAGES - 1)] of String = ('180 - Falha na inicialização da gravação.',
                                                                                 '180 - Recording media initialization fail.',
                                                                                 '180 - Error de inicialización de la grabación.');

  APP_MB_VAX_ERR_OPEN_WAV           : array[0..(MAX_LANGUAGES - 1)] of String = ('181 - Não foi possível abrir o arquivo WAV.',
                                                                                 '181 - Cann`t open the wave file.',
                                                                                 '181 - No fue posible abrir el archivo WAV.');

  APP_MB_VAX_ERR_INVALID_SIP        : array[0..(MAX_LANGUAGES - 1)] of String = ('182 - SIP Informado é inválido.',
                                                                                 '182 - Provided SIP URI is not valid.',
                                                                                 '182 - SIP información no es válida.');

  APP_MB_VAX_ERR_CODEC              : array[0..(MAX_LANGUAGES - 1)] of String = ('183 - Codec não suportado.',
                                                                                 '183 - Codec is not supported.',
                                                                                 '183 - Codec no compatible.');

  APP_MB_VAX_ERR_CREATE_SDP         : array[0..(MAX_LANGUAGES - 1)] of String = ('184 - Erro ao criar solicitação SDP (Session Description Protocol).',
                                                                                 '184 - Error to create SDP (Session Description Protocol) request.',
                                                                                 '184 - Error al crear la solicitud de SDP (Session Description Protocol.');

  APP_MB_VAX_ERR_CREATE_CONECTION   : array[0..(MAX_LANGUAGES - 1)] of String = ('185 - Erro ao criar solicitação de Conexão.',
                                                                                 '185 - Error to create CONNECTION request. Please check the provided SIP URI is valid.',
                                                                                 '185 - Error al crear la solicitud de conexión.');

  APP_MB_VAX_ERR_CREATE_REGISTER    : array[0..(MAX_LANGUAGES - 1)] of String = ('186 - Erro ao criar solicitação de Registro.',
                                                                                 '186 - Error to create REGISTER request. Please check the provided SIP URI is valid.',
                                                                                 '186 - Error al crear la solicitud de registro.');

  APP_MB_VAX_ERR_CREATE_UNREGISTER  : array[0..(MAX_LANGUAGES - 1)] of String = ('187 - Erro ao criar solicitação de Desregistro.',
                                                                                 '187 - Error to create UN-REGISTER request. Please check the provided SIP URI is valid.',
                                                                                 '187 - Error al crear la solicitud de cancelación del registro.');

  APP_MB_VAX_ERR_CREATE_DISCONECTION: array[0..(MAX_LANGUAGES - 1)] of String = ('188 - Erro ao criar solicitação de Desconexão.',
                                                                                 '188 - Error to create DISCONNECT request.',
                                                                                 '188 - Error al crear la solicitud de desconexión.');

  APP_MB_VAX_ERR_INVALID_LINE       : array[0..(MAX_LANGUAGES - 1)] of String = ('189 - Nº de Linha inválida.',
                                                                                 '189 - Line No is not valid.',
                                                                                 '189 - El número de la línea no es válida.');

  APP_MB_VAX_ERR_BUSY_LINE          : array[0..(MAX_LANGUAGES - 1)] of String = ('190 - A linha está ocupada.',
                                                                                 '190 - Line is already busy.',
                                                                                 '190 - La línea está ocupada.');

  APP_MB_VAX_ERR_CLOSED_LINE        : array[0..(MAX_LANGUAGES - 1)] of String = ('191 - Linha não está aberta.',
                                                                                 '191 - Line is not open.',
                                                                                 '191 - La línea no está abierta.');

  APP_MB_VAX_ERR_INVALID_CALLID     : array[0..(MAX_LANGUAGES - 1)] of String = ('192 - ID da chamada Inválido.',
                                                                                 '192 - Invalid Call-Id.',
                                                                                 '192 - ID de la llamada no es válido.');

  APP_MB_VAX_ERR_INVALID_VALUE      : array[0..(MAX_LANGUAGES - 1)] of String = ('193 - Valor informado não é válido.',
                                                                                 '193 - Provided value is not valid.',
                                                                                 '193 - El Valor introducido no es válido.');

  APP_MB_VAX_ERR_INVALID_SESSION    : array[0..(MAX_LANGUAGES - 1)] of String = ('194 - Linha selecionada não está em uma sessão de voz válida.',
                                                                                 '194 - Selected line is not in voice session.',
                                                                                 '194 - Línea seleccionada no está en una sesión de voz válida.');

  APP_MB_VAX_ERR_READ_WAV           : array[0..(MAX_LANGUAGES - 1)] of String = ('195 - Falha de leitura do arquivo WAV.',
                                                                                 '195 - Fail to read wave file.',
                                                                                 '195 - Error al leer el archivo WAV.');

  APP_MB_VAX_ERR_WRITE_WAV          : array[0..(MAX_LANGUAGES - 1)] of String = ('196 - Falha de escrita do arquivo WAV.',
                                                                                 '196 - Fail to write wave file.',
                                                                                 '196 - Error de escrita a respecto del archivo WAV.');

  APP_MB_VAX_ERR_UNSUPPORTED_WAV    : array[0..(MAX_LANGUAGES - 1)] of String = ('197 - Arquivo WAV não suportado.',
                                                                                 '197 - Unsupported wave file format.',
                                                                                 '197 - Archivo WAV no compatible.');

  APP_MB_VAX_ERR_CANCEL_REQUEST     : array[0..(MAX_LANGUAGES - 1)] of String = ('198 - Erro ao criar solicitação de Cancelamento.',
                                                                                 '198 - Error to create CANCEL request. Please check the provided SIP URI is valid.',
                                                                                 '198 - Error al crear la solicitud de cancelación.');

  APP_MB_ERR_NO_QUEUES_RELATION     : array[0..(MAX_LANGUAGES - 1)] of String = ('011 - Este Agente não esta relacionado em nenhuma fila.' + #13 + 'Entre em contato com seu supervisor.',
                                                                                 '011 - This agent is not related in any row.' + #13 + 'Please contact your supervisor.',
                                                                                 '011 - Este agente no está relacionado de ninguna fila.' + #13 + 'Póngase en contacto con su supervisor.');

  APP_MB_VAX_ERR_GENERIC            : array[0..(MAX_LANGUAGES - 1)] of String = ('199 - Erro genérico de conexão SIP.',
                                                                                 '199 - ...',
                                                                                 '199 - ...');
   // Usuario
  APP_MB_ERR_INVALID_USER           : array[0..(MAX_LANGUAGES - 1)] of String = ('200 - Usuário não localizado.' + #13 + 'Tente Novamente.',
                                                                                 '200 - User not found.' + #13 + 'Try Again.',
                                                                                 '200 - Usuario no encontrado.' + #13 + 'Intente nuevamente.');
   // Colaborador
  APP_MB_ERR_INVALID_DEVELOPER      : array[0..(MAX_LANGUAGES - 1)] of String = ('201 - Usuário não localizado.' + #13 + 'Tente Novamente.',
                                                                                 '201 - User not found.' + #13 + 'Try Again.',
                                                                                 '201 - Usuario no encontrado.' + #13 + 'Intente nuevamente.');
   // Operação
  APP_MB_ERR_INVALID_OPERATION      : array[0..(MAX_LANGUAGES - 1)] of String = ('202 - Usuário esta associado a uma operação desativada.' + #13 + 'Tente Novamente.',
                                                                                 '202 - User is associated with a disabled operation.' + #13 + 'Try Again.',
                                                                                 '202 - El usuario está asociado con una operación de discapacitados.' + #13 + 'Intente nuevamente.');
   // Empresa
  APP_MB_ERR_INVALID_COMPANY        : array[0..(MAX_LANGUAGES - 1)] of String = ('203 - Usuário esta associado a uma empresa desativada.' + #13 + 'Tente Novamente.',
                                                                                 '203 - User is associated with a disabled company.' + #13 + 'Try Again.',
                                                                                 '203 - El usuario está asociada con una empresa discapacitados.' + #13 + 'Intente nuevamente.');


//frmClassifica
  APP_FRM_CLASSIFICATION_QUEUE         : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Fila',
                                                                                    '...',
                                                                                    '...');

  APP_FRM_CLASSIFICATION_CLASSIFICATION: array[0..(MAX_LANGUAGES - 1)] of String = ('Classificação',
                                                                                    'Classification',
                                                                                    'Clasificación');

  APP_FRM_CLASSIFICATION_SUB_CLASS     : array[0..(MAX_LANGUAGES - 1)] of String = ('Sub Classificação',
                                                                                    '...',
                                                                                    '...');

  APP_FRM_CLASSIFICATION_OBSERVATION   : array[0..(MAX_LANGUAGES - 1)] of String = ('Observação',
                                                                                    'Observation',
                                                                                    'Observación');

  APP_FRM_CLASSIFICATION_SCHEDULE      : array[0..(MAX_LANGUAGES - 1)] of String = ('Agendamento',
                                                                                    'Scheduling',
                                                                                    'Programación');

  APP_FRM_CLASSIFICATION_TYPE          : array[0..(MAX_LANGUAGES - 1)] of String = ('Tipo',
                                                                                    'Type',
                                                                                    'Tipo');

  APP_FRM_CLASSIFICATION_SPECIFIC      : array[0..(MAX_LANGUAGES - 1)] of String = ('Específico',
                                                                                    'Specific',
                                                                                    'Específico');

  APP_FRM_CLASSIFICATION_GENERIC       : array[0..(MAX_LANGUAGES - 1)] of String = ('Grupo',
                                                                                    'Group',
                                                                                    'Grupo');

  APP_FRM_CLASSIFICATION_DATE          : array[0..(MAX_LANGUAGES - 1)] of String = ('Data',
                                                                                    'Date',
                                                                                    'Fecha');

  APP_FRM_CLASSIFICATION_HOUR          : array[0..(MAX_LANGUAGES - 1)] of String = ('Hora',
                                                                                    'Time',
                                                                                    'Hora');

  APP_FRM_CLASSIFICATION_ASK_RECORDING : array[0..(MAX_LANGUAGES - 1)] of String = ('Solicitou Gravação?',
                                                                                    'Recording Requested?',
                                                                                    'Ha solicitado grabación?');

  APP_FRM_CLASSIFICATION_GOTO_PAUSE    : array[0..(MAX_LANGUAGES - 1)] of String = ('Entrar em Pausa',
                                                                                    'Enter into Pause',
                                                                                    'Empezar la pausa');

  APP_FRM_CLASSIFICATION_GOTO_LOGOFF   : array[0..(MAX_LANGUAGES - 1)] of String = ('Efetuar Logoff',
                                                                                    '...',
                                                                                    '...');

  APP_FRM_CLASSIFICATION_SAVE          : array[0..(MAX_LANGUAGES - 1)] of String = ('Salvar',
                                                                                    'Save',
                                                                                    'Salvar');

  APP_FRM_CLASSIFICATION_SELECTSUBCLASS: array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Sub Classificação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_CLASSIFICATION_MB_SCHED_TYPE : array[0..(MAX_LANGUAGES - 1)] of String = ('- Tipo de Agendamento' + #13,
                                                                                    '- Scheduling Type' + #13,
                                                                                    '- Tipo de Programación' + #13);

  APP_FRM_CLASSIFICATION_MB_SCHED_DATE : array[0..(MAX_LANGUAGES - 1)] of String = ('- Data de Agendamento' + #13,
                                                                                    '- Scheduling Date' + #13,
                                                                                    '- Fecha de programación' + #13);

  APP_FRM_CLASSIFICATION_MB_SCHED_TIME : array[0..(MAX_LANGUAGES - 1)] of String = ('- Hora de Agendamento' + #13,
                                                                                    '- Scheduling Time' + #13,
                                                                                    '- La Hora de programación' + #13);

  APP_FRM_CLASSIFICATION_MB_SCHED_INVDH: array[0..(MAX_LANGUAGES - 1)] of String = ('- Data de Agendamento' + #13,
                                                                                    '- Scheduling Date' + #13,
                                                                                    '- Fecha de programación' + #13);

  APP_FRM_CLASSIFICATION_MB_INVALIDCONF: array[0..(MAX_LANGUAGES - 1)] of String = ('Chamada classificada automaticamente devido a falta de itens para classificação.' + #13 + 'Contate o administrador.',
                                                                                    '...',
                                                                                    '...');

  APP_FRM_CLASSIFICATION_ERR_TRANSCRIPT: array[0..(MAX_LANGUAGES - 1)] of String = ('Erro ao recuperar a transcrição.',
                                                                                    '...',
                                                                                    '...');

//frmDialPad
  APP_FRM_DIALPAD_DIAL  : array[0..(MAX_LANGUAGES - 1)] of String = ('Discar',
                                                                     'Dial',
                                                                     'Marcar');

  APP_FRM_DIALPAD_PICKUP: array[0..(MAX_LANGUAGES - 1)] of String = ('Atender',
                                                                     'Answer',
                                                                     '');

  APP_FRM_DIALPAD_NUMBER: array[0..(MAX_LANGUAGES - 1)] of String = ('Número',
                                                                     'Number',
                                                                     'Número');

  APP_FRM_DIALPAD_MUTE  : array[0..(MAX_LANGUAGES - 1)] of String = ('Mudo',
                                                                     'Mute',
                                                                     'Mudo');

  APP_FRM_DIALPAD_HOLD  : array[0..(MAX_LANGUAGES - 1)] of String = ('Aguardar',
                                                                     'Hold',
                                                                     'Esperar');

  APP_FRM_DIALPAD_DND   : array[0..(MAX_LANGUAGES - 1)] of String = ('Não Perturbe',
                                                                     'DND',
                                                                     'No Molestar');

  APP_FRM_DIALPAD_CAUDIO: array[0..(MAX_LANGUAGES - 1)] of String = ('Conf. Audio',
                                                                     '...',
                                                                     '...');

//frmPausa
  APP_FRM_PAUSE_START_PAUSE : array[0..(MAX_LANGUAGES - 1)] of String = ('Pausar',
                                                                         'Pause',
                                                                         'Pausar');

  APP_FRM_PAUSE_END_PAUSE   : array[0..(MAX_LANGUAGES - 1)] of String = ('Sair de Pausa',
                                                                         'Unpause',
                                                                         'Salir de la pausa');

  APP_FRM_PAUSE_CHANGE_PAUSE: array[0..(MAX_LANGUAGES - 1)] of String = ('Trocar Pausa',
                                                                         'Change Pause',
                                                                         'Cambiar la Pausa');

  APP_FRM_PAUSE_SCHED_PAUSE : array[0..(MAX_LANGUAGES - 1)] of String = ('Agendar Pausa',
                                                                         '...',
                                                                         '...');

  APP_FRM_PAUSE_CANCEL_PAUSE: array[0..(MAX_LANGUAGES - 1)] of String = ('Cancelar',
                                                                         '...',
                                                                         '...');

//frmCoaching
  APP_FRM_COACHING_START: array[0..(MAX_LANGUAGES - 1)] of String = ('Iniciar',
                                                                     '...',
                                                                     '...');

  APP_FRM_COACHING_STOP : array[0..(MAX_LANGUAGES - 1)] of String = ('Terminar',
                                                                     '...',
                                                                     '...');

//frmXfer
  APP_FRM_XFER_XFER1              : array[0..(MAX_LANGUAGES - 1)] of String = ('Transferir',
                                                                               'Transfer',
                                                                               'Transferir');

  APP_FRM_XFER_XFER2              : array[0..(MAX_LANGUAGES - 1)] of String = ('Consultar',
                                                                               '...',
                                                                               '...');

  APP_FRM_XFER_QUEUE              : array[0..(MAX_LANGUAGES - 1)] of String = ('Fila',
                                                                               'Queue',
                                                                               'Cola');

  APP_FRM_XFER_IVR                : array[0..(MAX_LANGUAGES - 1)] of String = ('URA',
                                                                               'IVR',
                                                                               'URA');

  APP_FRM_XFER_EXTEN              : array[0..(MAX_LANGUAGES - 1)] of String = ('Usuário',
                                                                               'Extension',
                                                                               'Extensión');

  APP_FRM_XFER_RESEARCH           : array[0..(MAX_LANGUAGES - 1)] of String = ('Pesquisa',
                                                                               'Research',
                                                                               'Búsqueda');

  APP_FRM_XFER_VIRTUAL            : array[0..(MAX_LANGUAGES - 1)] of String = ('Virtual',
                                                                               '...',
                                                                               '...');

  APP_FRM_XFER_CONSULTATION       : array[0..(MAX_LANGUAGES - 1)] of String = ('Consulta',
                                                                               '...',
                                                                               '...');

  APP_FRM_XFER_SELECT_QUEUE       : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Fila',
                                                                               'Select the Queue',
                                                                               'Seleccione la cola');

  APP_FRM_XFER_SELECT_IVR         : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a URA',
                                                                               'Select the IVR',
                                                                               'Seleccione la URA');

  APP_FRM_XFER_SELECT_EXTEN       : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione o Ramal',
                                                                               'Select the Exten',
                                                                               'Seleccione la Extensión');

  APP_FRM_XFER_SELECT_RESEARCH    : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Pesquisa',
                                                                               'Select the Research',
                                                                               'Seleccione la Búsqueda');

  APP_FRM_XFER_SELECT_VIRTUAL     : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione o Ramal Virtual',
                                                                               '...',
                                                                               '...');

  APP_FRM_XFER_SELECT_CONSULTATION: array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Consulta',
                                                                               '...',
                                                                               '...');

//frmLogin

//frmDesbloquear
  APP_FRM_UNLOCK_LOGIN     : array[0..(MAX_LANGUAGES - 1)] of String = ('Login',
                                                                        'Login',
                                                                        'Login');

  APP_FRM_UNLOCK_PASS      : array[0..(MAX_LANGUAGES - 1)] of String = ('Senha',
                                                                        'Password',
                                                                        '...');

  APP_FRM_UNLOCK_UNLOCK    : array[0..(MAX_LANGUAGES - 1)] of String = ('Desbloquear',
                                                                        'Unlock',
                                                                        '...');

  APP_FRM_UNLOCK_CANCEL    : array[0..(MAX_LANGUAGES - 1)] of String = ('Cancelar',
                                                                        'Cancel',
                                                                        '...');

  APP_FRM_UNLOCK_SUP_LOGIN : array[0..(MAX_LANGUAGES - 1)] of String = ('Login - Supervisor',
                                                                        'Login - ...',
                                                                        'Login - ...');

  APP_FRM_UNLOCK_SUP_PASS  : array[0..(MAX_LANGUAGES - 1)] of String = ('Senha - Supervisor',
                                                                        'Password - ...',
                                                                        '... - ...');

  APP_FRM_UNLOCK_SUP_UNLOCK: array[0..(MAX_LANGUAGES - 1)] of String = ('Fechar',
                                                                        '...',
                                                                        '...');

  APP_FRM_UNLOCK_SUP_CANCEL: array[0..(MAX_LANGUAGES - 1)] of String = ('Cancelar',
                                                                        'Cancel',
                                                                        '...');

//frmChangePass
  APP_FRM_PASS_LOGIN: array[0..(MAX_LANGUAGES - 1)] of String = ('Login',
                                                                 'Login',
                                                                 'Login');

  APP_FRM_PASS_OLDPASS: array[0..(MAX_LANGUAGES - 1)] of String = ('Senha Anterior',
                                                                   'Old Password',
                                                                   '...');

  APP_FRM_PASS_NEWPASS: array[0..(MAX_LANGUAGES - 1)] of String = ('Nova Senha',
                                                                   'New Password',
                                                                   '...');

  APP_FRM_PASS_NEWPASSCON: array[0..(MAX_LANGUAGES - 1)] of String = ('Redigite a Nova Senha',
                                                                      'Retype New Password',
                                                                      '...');

  APP_FRM_PASS_CHANGEPASS: array[0..(MAX_LANGUAGES - 1)] of String = ('Alterar',
                                                                      'Change',
                                                                      '...');

  APP_FRM_PASS_CANCEL: array[0..(MAX_LANGUAGES - 1)] of String = ('Cancelar',
                                                                  'Cancel',
                                                                  '...');

//frmProgressBar
  APP_FRM_PROGRESSBAR_STATUS: array[0..(MAX_LANGUAGES - 1)] of String = ('Copiando arquivos...',
                                                                         '...',
                                                                         '...');

  APP_FRM_PROGRESSBAR_ERRBD : array[0..(MAX_LANGUAGES - 1)] of String = ('Erro ao escrever no BD de gravação de tela',
                                                                         '...',
                                                                         '...');

  APP_FRM_PROGRESSBAR_ERR1  : array[0..(MAX_LANGUAGES - 1)] of String = ('Erro ao copiar arquivo de gravação de tela (step 1)',
                                                                         '...',
                                                                         '...');

  APP_FRM_PROGRESSBAR_ERR2  : array[0..(MAX_LANGUAGES - 1)] of String = ('Erro ao copiar arquivo de gravação de tela (step 2)',
                                                                         '...',
                                                                         '...');

  APP_FRM_PROGRESSBAR_ERR3  : array[0..(MAX_LANGUAGES - 1)] of String = ('Erro ao copiar arquivo de gravação de tela (step 3)',
                                                                         '...',
                                                                         '...');

  APP_FRM_PROGRESSBAR_ERRCNT: array[0..(MAX_LANGUAGES - 1)] of String = ('Erro ao atualizar contador de threads de gravação de tela',
                                                                         '...',
                                                                         '...');

//frmSobre
  APP_FRM_ABOUT_CAPTION       : array[0..(MAX_LANGUAGES - 1)] of String = ('Sobre',
                                                                           'About',
                                                                           '...');

  APP_FRM_ABOUT_CMD_ZIPLOGS   : array[0..(MAX_LANGUAGES - 1)] of String = ('Compactar Logs',
                                                                           '...',
                                                                           '...');

  APP_FRM_ABOUT_CMD_HELP      : array[0..(MAX_LANGUAGES - 1)] of String = ('Solicitar Ajuda',
                                                                           '...',
                                                                           '...');

  APP_FRM_ABOUT_CMD_CLOSE     : array[0..(MAX_LANGUAGES - 1)] of String = ('Fechar',
                                                                           'Close',
                                                                           '...');

  APP_FRM_ABOUT_INFO_COMPANY  : array[0..(MAX_LANGUAGES - 1)] of String = ('Empresa: ',
                                                                           '...',
                                                                           '...');

  APP_FRM_ABOUT_INFO_APP      : array[0..(MAX_LANGUAGES - 1)] of String = ('Aplicação: ',
                                                                           '...',
                                                                           '...');

  APP_FRM_ABOUT_INFO_COPYRIGHT: array[0..(MAX_LANGUAGES - 1)] of String = ('Copyright: ',
                                                                           '...',
                                                                           '...');

  APP_FRM_ABOUT_INFO_DEVELOPED: array[0..(MAX_LANGUAGES - 1)] of String = ('Desenvolvido por: ',
                                                                           '...',
                                                                           '...');

//frmConfAudio
  APP_FRM_CONFAUDIO_CAPTION      : array[0..(MAX_LANGUAGES - 1)] of String = ('Configurações de Áudio',
                                                                              '...',
                                                                              '...');

  APP_FRM_CONFAUDIO_CMD_SAVE     : array[0..(MAX_LANGUAGES - 1)] of String = ('Salvar',
                                                                              'Save',
                                                                              '...');

  APP_FRM_CONFAUDIO_CMD_CANCEL   : array[0..(MAX_LANGUAGES - 1)] of String = ('Cancelar',
                                                                              'Cancel',
                                                                              '...');

  APP_FRM_CONFAUDIO_CMD_CLOSE    : array[0..(MAX_LANGUAGES - 1)] of String = ('Fechar',
                                                                              'Close',
                                                                              '...');

  APP_FRM_CONFAUDIO_INFO_IN      : array[0..(MAX_LANGUAGES - 1)] of String = ('[ Dispositivos de entrada ]',
                                                                              '...',
                                                                              '...');

  APP_FRM_CONFAUDIO_INFO_TOTALIN : array[0..(MAX_LANGUAGES - 1)] of String = ('Total de dispositivos',
                                                                              'Close',
                                                                              '...');

  APP_FRM_CONFAUDIO_INFO_DEVICEIN: array[0..(MAX_LANGUAGES - 1)] of String = ('Fechar',
                                                                              'Close',
                                                                              '...');

//frmPrincipal
  APP_FRM_MAIN_STATUS_LOGOFF         : array[0..(MAX_LANGUAGES - 1)] of String = ('Deslogado',
                                                                                  'Offline',
                                                                                  'Fuera de Línea');

  APP_FRM_MAIN_STATUS_PAUSE_LOGIN    : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Pausa: Login',
                                                                                  'Paused: Login',
                                                                                  'En Pausa: Login');

  APP_FRM_MAIN_STATUS_AVAILABLE      : array[0..(MAX_LANGUAGES - 1)] of String = ('Disponível',
                                                                                  'Available',
                                                                                  'Disponible');

  APP_FRM_MAIN_STATUS_RINGING        : array[0..(MAX_LANGUAGES - 1)] of String = ('Chamando',
                                                                                  'Ringing',
                                                                                  '');

  APP_FRM_MAIN_STATUS_PAUSE_DB       : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Pausa: ',
                                                                                  'Paused: ',
                                                                                  'En Pausa: ');

  APP_FRM_MAIN_STATUS_PAUSE_AFTER_HU : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Pausa: Pos Atendimento',
                                                                                  'Pause: After Answer',
                                                                                  'En Pausa: Pos Atención');

  APP_FRM_MAIN_STATUS_DIALING        : array[0..(MAX_LANGUAGES - 1)] of String = ('Discando',
                                                                                  'Dialing',
                                                                                  'Marcando');

  APP_FRM_MAIN_STATUS_UNREGISTERED   : array[0..(MAX_LANGUAGES - 1)] of String = ('Não Registrado',
                                                                                  'Unregistered',
                                                                                  'No Registrado');

  APP_FRM_MAIN_STATUS_DIAL_BUSY      : array[0..(MAX_LANGUAGES - 1)] of String = ('Destino Ocupado',
                                                                                  'Destination Busy',
                                                                                  'Destino Ocupado');

  APP_FRM_MAIN_STATUS_DIAL_CONGESTION: array[0..(MAX_LANGUAGES - 1)] of String = ('Chamada Não Completada',
                                                                                  '...',
                                                                                  '...');

  APP_FRM_MAIN_STATUS_DIAL_NO_ANSWER : array[0..(MAX_LANGUAGES - 1)] of String = ('Destino Não Atende',
                                                                                  'Destination No Answer',
                                                                                  'El destino no atiende');

  APP_FRM_MAIN_STATUS_ACTIVE         : array[0..(MAX_LANGUAGES - 1)] of String = ('Ativo',
                                                                                  'Active',
                                                                                  'Activo');

  APP_FRM_MAIN_STATUS_ANSWERED       : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Atendimento',
                                                                                  'In Attendance',
                                                                                  'En Atendimento');

  APP_FRM_MAIN_STATUS_ROOT_LOGGEDOUT : array[0..(MAX_LANGUAGES - 1)] of String = ('Deslogado pelo Supervisor',
                                                                                  'Logged Out By The Supervisor',
                                                                                  'Desconectado por el Supervisor');

  APP_FRM_MAIN_STATUS_TRANSFERRED    : array[0..(MAX_LANGUAGES - 1)] of String = ('Chamada Transferida',
                                                                                  '...',
                                                                                  '...');

  APP_FRM_MAIN_STATUS_CONSULTATION   : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Consulta',
                                                                                  '...',
                                                                                  '...');

  APP_FRM_MAIN_DESC_PAUSE_TIME: array[0..(MAX_LANGUAGES - 1)] of String = ('Tempo de Pausa Esgotado.' + #13 + 'Entre em Contato com seu supervisor.',
                                                                           'Pause Timeout.' + #13 + 'Contact your supervisor.',
                                                                           'Tiempo de Pausa Agotado' + #13 + 'Póngase en contacto con su supervisor.');

  APP_FRM_MAIN_DESC_PROTOCOL  : array[0..(MAX_LANGUAGES - 1)] of String = ('Protocolo:',
                                                                           'Protocol:',
                                                                           'Protocolo:');

  APP_FRM_MAIN_DESC_STORE     : array[0..(MAX_LANGUAGES - 1)] of String = ('Loja:',
                                                                           'Store:',
                                                                           '...:');

  APP_FRM_MAIN_DESC_NUMBER    : array[0..(MAX_LANGUAGES - 1)] of String = ('Número:',
                                                                           'Number:',
                                                                           'Número:');

  APP_FRM_MAIN_DESC_QUEUE     : array[0..(MAX_LANGUAGES - 1)] of String = ('Fila:',
                                                                           'Queue:',
                                                                           'Cola:');

  APP_FRM_MAIN_DESC_CUSTOMER  : array[0..(MAX_LANGUAGES - 1)] of String = ('C.:',//'Cliente:',
                                                                           'C.:',//'Customer:',
                                                                           'C.:');//'Cliente:');

  APP_FRM_MAIN_DESC_START     : array[0..(MAX_LANGUAGES - 1)] of String = ('Início:',
                                                                           'Start:',
                                                                           'El Inicio:');

  APP_FRM_MAIN_DESC_DURATION  : array[0..(MAX_LANGUAGES - 1)] of String = ('Duração:',
                                                                           'Duration:',
                                                                           'Duración:');

  APP_FRM_MAIN_DESC_PAUSE     : array[0..(MAX_LANGUAGES - 1)] of String = ('Pausa:',
                                                                           'Pause:',
                                                                           'Pausa:');

  APP_FRM_MAIN_DESC_TRANSCRIPT: array[0..(MAX_LANGUAGES - 1)] of String = ('Transcrição:',
                                                                           'Transcription:',
                                                                           '...:');

  APP_FRM_MAIN_CALL_QUALITY   : array[0..(MAX_LANGUAGES - 1)] of String = ('Qualidade da Chamada:',
                                                                           'Call Quality:',
                                                                           '...:');

  APP_FRM_MAIN_BTN_LOGIN   : array[0..(MAX_LANGUAGES - 1)] of String = ('Login',
                                                                        'Login',
                                                                        'Iniciar sesión');

  APP_FRM_MAIN_BTN_LOGOFF  : array[0..(MAX_LANGUAGES - 1)] of String = ('Logoff',
                                                                        'Logoff',
                                                                        'Cierre de Sesión');

  APP_FRM_MAIN_BTN_CLOSE   : array[0..(MAX_LANGUAGES - 1)] of String = ('Fechar o Agente',
                                                                        'Close the Agent',
                                                                        'Cerrar el Agente');

  APP_FRM_MAIN_BTN_HANGUP  : array[0..(MAX_LANGUAGES - 1)] of String = ('Desligar',
                                                                        'Hang Up',
                                                                        'Colgar');//'Desenchufar');

  APP_FRM_MAIN_BTN_CUSTOMER: array[0..(MAX_LANGUAGES - 1)] of String = ('TEL',
                                                                        'TEL',
                                                                        'TEL');

  APP_FRM_MAIN_BTN_AGENDA  : array[0..(MAX_LANGUAGES - 1)] of String = ('AGENDA',
                                                                        'AGENDA',
                                                                        'PROGRAMACIÓN');

  APP_FRM_MAIN_BTN_SCRIPT  : array[0..(MAX_LANGUAGES - 1)] of String = ('SCRIPT',
                                                                        'SCRIPT',
                                                                        'EL GUIÓN');

  APP_FRM_MAIN_BTN_CHAT    : array[0..(MAX_LANGUAGES - 1)] of String = ('CHAT',
                                                                        'CHAT',
                                                                        'CHARLAR');

  APP_FRM_MAIN_BTN_EMAIL   : array[0..(MAX_LANGUAGES - 1)] of String = ('E-MAIL',
                                                                        'E-MAIL',
                                                                        'E-MAIL');

  APP_FRM_MAIN_BTN_FAX     : array[0..(MAX_LANGUAGES - 1)] of String = ('FAX',
                                                                        'FAX',
                                                                        'FAX');

  APP_FRM_MAIN_BTN_SMS     : array[0..(MAX_LANGUAGES - 1)] of String = ('SMS',
                                                                        'SMS',
                                                                        'SMS');

  APP_FRM_MAIN_BTN_RESEARCH: array[0..(MAX_LANGUAGES - 1)] of String = ('PESQUISA',
                                                                        'RESEARCH',
                                                                        'BÚSQUEDA');

  APP_FRM_MAIN_BTN_HELP    : array[0..(MAX_LANGUAGES - 1)] of String = ('AJUDA',
                                                                        'HELP',
                                                                        'AYUDA');

  APP_FRM_MAIN_BTN_CONF    : array[0..(MAX_LANGUAGES - 1)] of String = ('CONF',//Conferência
                                                                        'CONF',//Conference
                                                                        '...');

  APP_FRM_MAIN_BTN_INTEG   : array[0..(MAX_LANGUAGES - 1)] of String = ('INTEGRADOR',
                                                                        '...',
                                                                        '...');

  APP_FRM_MAIN_FRAME_BAR_DIALPAD       : array[0..(MAX_LANGUAGES - 1)] of String = ('Telefone Virtual',
                                                                                    'Virtual Phone',
                                                                                    'Teléfono Virtual');

  APP_FRM_MAIN_FRAME_BAR_TRANSFER      : array[0..(MAX_LANGUAGES - 1)] of String = ('Transferência / Consulta',
                                                                                    'Transfer / ...',
                                                                                    'Transferencia / ...');

  APP_FRM_MAIN_FRAME_BAR_PAUSE         : array[0..(MAX_LANGUAGES - 1)] of String = ('Pausa',
                                                                                    'Pause',
                                                                                    'Pausa');

  APP_FRM_MAIN_FRAME_BAR_CONFIGURATION : array[0..(MAX_LANGUAGES - 1)] of String = ('Configurações',
                                                                                    'Configurations',
                                                                                    'Configuraciones');

  APP_FRM_MAIN_FRAME_BAR_COACHING      : array[0..(MAX_LANGUAGES - 1)] of String = ('Coaching',
                                                                                    '...',
                                                                                    '...');


  APP_FRM_MAIN_FRAME_BAR_CLASSIFICATION: array[0..(MAX_LANGUAGES - 1)] of String = ('Classificação',
                                                                                    'Classification',
                                                                                    'Clasificación');

  APP_FRM_MAIN_STATUS_BAR_NOT_REGISTED : array[0..(MAX_LANGUAGES - 1)] of String = ('Ramal não Registrado',
                                                                                    'Exten not Registered',
                                                                                    'Extensión sin registro');

  APP_FRM_MAIN_STATUS_BAR_AGENT        : array[0..(MAX_LANGUAGES - 1)] of String = ('Agente: ',
                                                                                    'Agent: ',
                                                                                    'Agente: ');

  APP_FRM_MAIN_STATUS_BAR_LOGIN        : array[0..(MAX_LANGUAGES - 1)] of String = ('Login: ',
                                                                                    'Login: ',
                                                                                    'Inicio de sesión: ');

  APP_FRM_MAIN_STATUS_BAR_VERSION      : array[0..(MAX_LANGUAGES - 1)] of String = ('Versão: ',
                                                                                    'Version: ',
                                                                                    'Versión: ');

  APP_FRM_MAIN_STATUS_BAR_S2V_STOPPED  : array[0..(MAX_LANGUAGES - 1)] of String = ('Parado',
                                                                                    'Stopped',
                                                                                    '');

  APP_FRM_MAIN_STATUS_BAR_S2V_CAPTURING: array[0..(MAX_LANGUAGES - 1)] of String = ('Capturando',
                                                                                    'Capturing',
                                                                                    '');

  APP_FRM_MAIN_STATUS_BAR_S2V_DISABLED : array[0..(MAX_LANGUAGES - 1)] of String = ('Desabilitado',
                                                                                    'Disabled',
                                                                                    '');

  APP_FRM_MAIN_STATUS_BAR_S2V_SPLITTING: array[0..(MAX_LANGUAGES - 1)] of String = ('Dividindo',
                                                                                    'Splitting',
                                                                                    '');

  APP_FRM_MAIN_STATUS_BAR_EXTEN        : array[0..(MAX_LANGUAGES - 1)] of String = ('Ramal ',
                                                                                    'Extension ',
                                                                                    'Extensión ');

  APP_FRM_MAIN_STATUS_BAR_UNREGISTERED : array[0..(MAX_LANGUAGES - 1)] of String = (' Não Registrado',
                                                                                    ' Unregistered',
                                                                                    ' No hay registro');

  APP_FRM_MAIN_STATUS_BAR_REGISTERED   : array[0..(MAX_LANGUAGES - 1)] of String = (' Registrado',
                                                                                    ' Registered',
                                                                                    ' Registro');

  APP_FRM_MAIN_STATUS_BAR_REGISTERING  : array[0..(MAX_LANGUAGES - 1)] of String = (' Registrando',
                                                                                    ' Registering',
                                                                                    ' Registrando');

  APP_FRM_MAIN_CHAT_SELECT_GROUP       : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione o Grupo',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SELECT_ANSWER      : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Resposta',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_AVAILABLE          : array[0..(MAX_LANGUAGES - 1)] of String = ('Disponível',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_STATUS_PAUSE       : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Pausa',
                                                                                    'Paused',
                                                                                    'En Pausa');

  APP_FRM_MAIN_CHAT_AGENT_INACTIVE     : array[0..(MAX_LANGUAGES - 1)] of String = ('Inativo Agente:',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_CLIENT_INACTIVE    : array[0..(MAX_LANGUAGES - 1)] of String = ('Inativo Cliente:',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_TOTAL_DURATION     : array[0..(MAX_LANGUAGES - 1)] of String = ('Duração Total:',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_HANGUP             : array[0..(MAX_LANGUAGES - 1)] of String = ('Encerrar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_OPEN_MORE          : array[0..(MAX_LANGUAGES - 1)] of String = ('Mais opções',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_DIAL               : array[0..(MAX_LANGUAGES - 1)] of String = ('Discar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_NAME               : array[0..(MAX_LANGUAGES - 1)] of String = ('Nome:',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_EMAIL              : array[0..(MAX_LANGUAGES - 1)] of String = ('E-Mail: ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_TELEPHONE          : array[0..(MAX_LANGUAGES - 1)] of String = ('Tel.: ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_ROOM               : array[0..(MAX_LANGUAGES - 1)] of String = ('Sala: ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_INCHAT             : array[0..(MAX_LANGUAGES - 1)] of String = ('Em Atendimento',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_CLASSIFYING        : array[0..(MAX_LANGUAGES - 1)] of String = ('Classificando',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SELECT_CLASS       : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Classificação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SELECT_SUB_CLASS   : array[0..(MAX_LANGUAGES - 1)] of String = ('Selecione a Sub Classificação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_TITLE_CLASS        : array[0..(MAX_LANGUAGES - 1)] of String = ('[ Classificação ]',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_WROTE              : array[0..(MAX_LANGUAGES - 1)] of String = (' escreveu:',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_BLOB_RECEIVED      : array[0..(MAX_LANGUAGES - 1)] of String = (' enviou um novo arquivo:',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_BLOB_RECEIVED_DIR  : array[0..(MAX_LANGUAGES - 1)] of String = ('Arquivo disponível em: ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_TITLE_CLASSIFYING  : array[0..(MAX_LANGUAGES - 1)] of String = ('[ Classificação - CHAT ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SEL_CLASSIFICATION : array[0..(MAX_LANGUAGES - 1)] of String = ('- Tipo de Classificação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SEL_SCLASSIFICATION: array[0..(MAX_LANGUAGES - 1)] of String = ('- Tipo de Sub Classificação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_AUTOSCROLL         : array[0..(MAX_LANGUAGES - 1)] of String = ('Auto rolagem',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SEND               : array[0..(MAX_LANGUAGES - 1)] of String = ('Enviar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_CLEAR              : array[0..(MAX_LANGUAGES - 1)] of String = ('Limpar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SAVE               : array[0..(MAX_LANGUAGES - 1)] of String = ('Salvar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_CLASS              : array[0..(MAX_LANGUAGES - 1)] of String = ('Classificação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_CHAT_SUB_CLASS          : array[0..(MAX_LANGUAGES - 1)] of String = ('Sub Classificação',
                                                                                    '',
                                                                                    '..');

  APP_FRM_MAIN_CHAT_OBS_CLASS          : array[0..(MAX_LANGUAGES - 1)] of String = ('Observação',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_TOTAL             : array[0..(MAX_LANGUAGES - 1)] of String = (' e-mail recebido, ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_TOTAIS            : array[0..(MAX_LANGUAGES - 1)] of String = (' e-mails recebidos, ',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_NAOLIDO           : array[0..(MAX_LANGUAGES - 1)] of String = (' não lido.',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_NAOLIDOS          : array[0..(MAX_LANGUAGES - 1)] of String = (' não lidos.',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_CMD          : array[0..(MAX_LANGUAGES - 1)] of String = ('Enviar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_CANCELAR     : array[0..(MAX_LANGUAGES - 1)] of String = ('Descartar',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_DE           : array[0..(MAX_LANGUAGES - 1)] of String = ('De',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_PARA         : array[0..(MAX_LANGUAGES - 1)] of String = ('Para',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_CC           : array[0..(MAX_LANGUAGES - 1)] of String = ('Cc...',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_CCO          : array[0..(MAX_LANGUAGES - 1)] of String = ('Cco...',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_SEND_ASSUNTO      : array[0..(MAX_LANGUAGES - 1)] of String = ('Assunto',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_READ_DATAHORA     : array[0..(MAX_LANGUAGES - 1)] of String = ('Em',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_READ_PESQUISAR_TXT: array[0..(MAX_LANGUAGES - 1)] of String = ('Pesquisar Caixa de Correio...',
                                                                                    '',
                                                                                    '...');

  APP_FRM_MAIN_EMAIL_READ_PESQUISAR_CMD: array[0..(MAX_LANGUAGES - 1)] of String = ('Clique aqui para pesquisar',
                                                                                    '',
                                                                                    '...');

implementation

end.
