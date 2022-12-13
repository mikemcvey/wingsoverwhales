<div class="grid">
  <div class="inner col">
    <h2><strong>Edit Listing</strong></h3>
   <% if $SiteAdmin %>
<p>
<span class="badge badge-info--inverted">You are logged in as the Administrator</span>
</p>
<% end_if %>
    <p><a class="button small alt" href="{$Top.Link}">&larr; Dashboard</a> <a class="button" href="/{$Link}logout">Log out</a></p>
       
    <% if $Allowed %>
      <% uncached %>
      $ProductForm
      <% end_uncached %>
    <% else %>
      <p>You do not have access to this Listing.</p>
    <% end_if %>
  </div>
</div>

<script>
  $(function() {
    tinymce.init({
      selector: '.htmleditor textarea',
      skin: 'silverstripe',
      menubar: false,
      statusbar: false,
      style_formats: [
           
            {title: 'Heading 3', format: 'h3'},
            {title: 'Heading 4', format: 'h4'},
            {title: 'Heading 5', format: 'h5'},
            {title: 'Heading 6', format: 'h6'},
            {title: 'Normal', block: 'p'}
        ],
    });

    var dz = Dropzone.forElement("#GalleryImagesDropzone");

    console.log(dz.options)

    dz.on('success', function(file, response) {
      console.log(file, response);
      $(file.previewElement).data('id', response);
    });

    $('.file-attachment-field-previews').sortable({
      stop: function(e, ui) {
        var aIDs = $(e.target).find('li').map(function() {
          return parseInt( $(this).data('id') );
        }).get();

        if(!$('.gallery-images-order').length) {
          $('#Form_ProductForm').append('<input type="hidden" name="galleryImagesOrder" class="gallery-images-order" value="" />');
        }

        $('.gallery-images-order').val(aIDs.join(','));
      }
    });
    
    $('[type=submit]').click(function(e) {
      $(this).parents('form').data('clicked', {name: $(this).prop('name'), val: $(this).val()});
    });

    $('.js-ajax-form').submit(function(e) {
      var jForm = $(this);
      var formData = jForm.serialize();
      var formAction = jForm.prop('action');
      var formMethod = jForm.prop('method');
      //var encType = jForm.prop('enctype');

      var oBtn = jForm.data('clicked');
      var jBtn = jForm.find('[type=submit][value="'+oBtn.val+'"]');
      // bypass ajax for these actions.... (could re-instate but wanted form to force reset)
      if(oBtn.val === 'Cancel' || oBtn.val === 'Preview' || oBtn.val === 'Accept and Publish' || oBtn.val === 'Submit For Approval' || oBtn.val ===  'Accept and Publish') {
        return true;
      }

      formData += '&'+oBtn.name+'='+encodeURI(oBtn.val);
      
      $.ajax({
        beforeSend: function(jqXHR,settings) {
          if (jForm.prop('isSending')) {
            return false;
          }
          jForm.prop('isSending',true);
          jBtn.val(oBtn.val + '...');
        },
        complete: function(jqXHR,textStatus) {
          jForm.prop('isSending',false);
          jBtn.val(oBtn.val);
        },
        //contentType: encType,
        data: formData,
        dataType: 'json',
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(textStatus);
              //scroll	
          var targetOffset = Math.floor($('#Form_ProductForm').offset().top);		 
          $('html,body').animate({scrollTop: targetOffset}, 1000, function() {
          jQuery(window).scroll();
      
        });
          $('<p class="message error">'+textStatus+'</p>').prependTo(jForm).delay(3000).fadeOut();

          //window.location = window.location;
        },
        success: function(data, textStatus, jqXHR) {
          
          console.log(data);

          $('.dropzone-image.removed').remove();
        //scroll	
        var targetOffset = Math.floor($('#Form_ProductForm').offset().top);		 
        $('html,body').animate({scrollTop: targetOffset}, 1000, function() {
          jQuery(window).scroll();
        });
          $('<p class="message good">'+data.message+'</p>').prependTo(jForm).delay(3000).fadeOut();
        },
        type: formMethod,
        url: formAction
      });

      e.preventDefault();
    });
  });
</script>