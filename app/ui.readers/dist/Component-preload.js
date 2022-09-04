//@ui5-bundle kb/ui/readers/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"kb/ui/readers/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("kb.ui.readers.Component",{metadata:{manifest:"json"}})});
},
	"kb/ui/readers/i18n/i18n.properties":'# This is the resource bundle for kb.ui.readers\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Readers\n\n#YDES: Application description\nappDescription=Readers\n\nflpTitle=Readers\n\nflpSubtitle=\n',
	"kb/ui/readers/manifest.json":'{"_version":"1.40.0","sap.app":{"id":"kb.ui.readers","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:lrop","version":"1.7.1","toolsId":"aff44742-46f9-4740-ba73-fff8af63f1fd"},"dataSources":{"mainService":{"uri":"library/","type":"OData","settings":{"annotations":["annotation"],"localUri":"localService/metadata.xml","odataVersion":"4.0"}},"annotation":{"type":"ODataAnnotation","uri":"annotations/annotation.xml","settings":{"localUri":"annotations/annotation.xml"}}},"crossNavigation":{"inbounds":{"kb-ui-readers-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"Readers","action":"manage","title":"{{flpTitle}}","subTitle":"{{flpSubtitle}}","icon":""}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.102.1","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"kb.ui.readers.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"routes":[{"pattern":":?query:","name":"ReadersList","target":"ReadersList"},{"pattern":"Readers({key}):?query:","name":"ReadersObjectPage","target":"ReadersObjectPage"}],"targets":{"ReadersList":{"type":"Component","id":"ReadersList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"Readers","variantManagement":"Page","navigation":{"Readers":{"detail":{"route":"ReadersObjectPage"}}}}}},"ReadersObjectPage":{"type":"Component","id":"ReadersObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"Readers"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"kblibraryservice"}}'
}});
