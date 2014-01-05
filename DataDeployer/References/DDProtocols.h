#if !(ConfigurationControllerImport)
    #import "../Protocols/ProtocolController/DDProtocolConfigurationController.h"
    #define ConfigurationControllerImport true
#endif

#if !(DDProtocolControllerImport)
    #import "../Protocols/ProtocolController/DDProtocolController.h"
    #define DDProtocolControllerImport true
#endif

#if !(DDProtocolPathControllerImport)
    #import "../Protocols/ProtocolController/DDProtocolPathController.h"
    #define DDProtocolPathControllerImport true
#endif

#if !(DDProtocolConfigurationImport)
    #import "../Protocols/ProtocolData/DDProtocolConfiguration.h"
    #define DDProtocolConfigurationImport true
#endif

#if !(DDProtocolApplicationImport)
    #import "../Protocols/ProtocolData/DDProtocolApplication.h"
    #define DDProtocolApplicationImport true
#endif

#if !(DDWithUrlImport)
    #import "../Protocols/ProtocolData/DDWithUrl.h"
    #define DDWithUrlImport true
#endif