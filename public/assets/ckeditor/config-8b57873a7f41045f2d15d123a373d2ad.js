CKEDITOR.editorConfig=function(e){e.assets_languages=["ru"],e.language="ru",e.filebrowserBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashUploadUrl="/ckeditor/attachment_files",e.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",e.filebrowserImageBrowseUrl="/ckeditor/pictures",e.filebrowserImageUploadUrl="/ckeditor/pictures",e.filebrowserUploadUrl="/ckeditor/attachment_files",e.allowedContent=!0,e.dialog_noConfirmCancel=!0,e.filebrowserParams=function(){for(var e,t,i,s=document.getElementsByTagName("meta"),n=new Object,o=0;o<s.length;o++)switch(i=s[o],i.name){case"csrf-token":e=i.content;break;case"csrf-param":t=i.content;break;default:continue}return void 0!==t&&void 0!==e&&(n[t]=e),n},e.addQueryString=function(e,t){var i=[];if(!t)return e;for(var s in t)i.push(s+"="+encodeURIComponent(t[s]));return e+(-1!=e.indexOf("?")?"&":"?")+i.join("&")},CKEDITOR.on("dialogDefinition",function(t){var i,s,n=t.data.name,o=t.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],n)>-1&&(i=o.getContents("Upload")||o.getContents("upload"),s=null==i?null:i.get("upload"),s&&s.filebrowser&&void 0===s.filebrowser.params&&(s.filebrowser.params=e.filebrowserParams(),s.action=e.addQueryString(s.action,s.filebrowser.params)))}),e.toolbar=[{name:"document",groups:["mode","document","doctools"]},{name:"clipboard",groups:["clipboard","undo"],items:["Cut","Copy","Paste","PasteText","PasteFromWord","-","Undo","Redo"]},{name:"links",items:["Link","Unlink","Anchor"]},{name:"insert",items:["Image","Flash","Table","HorizontalRule","SpecialChar"]},{name:"paragraph",groups:["list","indent","blocks","align","bidi"],items:["NumberedList","BulletedList","-","Outdent","Indent","-","Blockquote","CreateDiv","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"]},"/",{name:"styles",items:["Styles","Format","Font","FontSize"]},{name:"colors",items:["TextColor","BGColor"]},{name:"basicstyles",groups:["basicstyles","cleanup"],items:["Bold","Italic","Underline","Strike","Subscript","Superscript","-","RemoveFormat"]}],e.toolbar_mini=[{name:"basicstyles",groups:["basicstyles","cleanup"],items:["Bold","Italic","Underline","Strike","Subscript","Superscript","-","RemoveFormat"]},{name:"paragraph",groups:["list","indent","blocks","align","bidi"],items:["NumberedList","BulletedList","-","Outdent","Indent","-","Blockquote","CreateDiv","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"]},{name:"styles",items:["Font","FontSize"]},{name:"colors",items:["TextColor","BGColor"]},{name:"insert",items:["Image","Table","HorizontalRule","SpecialChar"]}],e.toolbar_mini_fishing=[{name:"jsonlinks",items:["JsonLinks"]},{name:"basicstyles",groups:["basicstyles","cleanup"],items:["Bold","Italic","Underline","Strike","-","RemoveFormat"]},{name:"styles",items:["Font","FontSize"]},{name:"paragraph",groups:["list","indent","blocks","align","bidi"],items:["NumberedList","BulletedList","-","Outdent","Indent","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"]},{name:"insert",groups:["link","image"],items:["Link","Unlink","-","Image","Flash"]}],e.extraPlugins="JsonLinks",e.toolbar="mini_fishing",e.removePlugins="elementspath",e.removeDialogTabs="link:upload;image:Upload;flash:Upload"};