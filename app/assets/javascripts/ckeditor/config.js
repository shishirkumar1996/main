CKEDITOR.config.toolbar_body = [
		{ name: 'document', items: ['Source','Templates', 'NewPage', 'Image', '-','Bold', 'Italic', '-', 'Subscript' , 'Superscript'] } ];


CKEDITOR.config.height = 300;

CKEDITOR.editorConfig = function( config ) {

	config.filebrowserImageBrowseUrl = '/ckeditor/pictures';
	config.filebrowserImageUploadUrl = '/ckeditor/pictures';
	//config.image_previewText = 'preview will be shown here';
	config.image_previewText = '     ';
	};

CKEDITOR.on( 'dialogDefinition', function( ev )
   {
      var dialogName = ev.data.name;
      var dialogDefinition = ev.data.definition;
      ev.data.definition.resizable = CKEDITOR.DIALOG_RESIZE_NONE;


/*      if ( dialogName == 'link' )
      {
         var infoTab = dialogDefinition.getContents( 'info' );
         infoTab.remove( 'protocol' );
         dialogDefinition.removeContents( 'target' );
         dialogDefinition.removeContents( 'advanced' );
      }
*/
      if ( dialogName == 'image' )
      {
		   dialogDefinition.removeContents( 'Link' );
         dialogDefinition.removeContents( 'advanced' );
         var infoTab = dialogDefinition.getContents( 'info' );
         infoTab.remove( 'txtBorder' );
         infoTab.remove( 'txtHSpace' );
         infoTab.remove( 'txtVSpace' );
         infoTab.remove( 'cmbAlign' );
	//	 	 	 infoTab.remove( 'txtUrl' );	  causes a problem, resolve it later                 
      }

      dialogDefinition.onLoad = function () {
            var dialog = CKEDITOR.dialog.getCurrent();


             //var elem = dialog.getContentElement('info','Height').setValue(200);

//            elem.getElement().hide();

           // dialog.hidePage( 'Link' );
            //dialog.hidePage( 'advanced' );
           //dialog.hidePage( 'info' ); // works now (CKEditor v3.6.4)
            this.selectPage('Upload');

            var uploadTab = dialogDefinition.getContents('Upload');
            var uploadButton = uploadTab.get('uploadButton');
            uploadButton['filebrowser']['onSelect'] = function( fileUrl, errorMessage ) {
                //$("input.cke_dialog_ui_input_text").val(fileUrl);
                dialog.getContentElement('info', 'txtUrl').setValue(fileUrl);
               // dialog.getContentElement('info','Height').setValue('200');
                $("input.cke_dialog_ui_button_ok span").click();
            }
        };

   });
