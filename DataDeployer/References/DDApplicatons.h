//protocols
#if !(DDProtocolApplicationImport)
    #import "../Protocols/ProtocolData/DDProtocolApplication.h"
    #define DDProtocolApplicationImport true
#endif

// classes
#if !(DDApplicationPersistenceImport)
    #import "../Application/DDApplicationPersistence.h"
    #define DDApplicationPersistenceImport true
#endif

#if !(DDApplicationDataImport)
    #import "../Application/DDApplicationData.h"
    #define DDApplicationDataImport true
#endif