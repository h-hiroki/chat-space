$(function(){
  function buildHTML(message){
    var html_image = message.image === null ? "" : `<img src="${message.image}" class="contents__body__messeage-image">`
    var html = `<div class="contents__body__messeage" data-message-id="${message.id}">
                  <div class="contents__body__messeage-name">
                    ${message.name}
                  </div>
                  <div class="contents__body__messeage-time">
                    ${message.created_at}
                  </div>
                  <div class="contents__body__messeage-body">
                    ${message.body}
                  </div>
                    ${html_image}
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.contents__body__messeage-list').append(html);
      $('#contents__footer__form').val('');
      $('.contents__footer__btn__input-field').val('');
      $('.contents__body').animate( {scrollTop: $('.contents__body__messeage-list')[0].scrollHeight} );
    })
    .fail(function(){
      alert('error');
    })

  })

  var autoUpdate = function(){
    var url = location.href;
    if(url.match(/groups\/[0-9]+\/messages/)){

      $.ajax({
        url: location.href,
        type: 'GET',
        dataType: 'json'
      })

      .done(function(messages){
        var latest_id = $(".contents__body__messeage:last").data('message-id');
        var insertHTML = '';
        messages.forEach(function(message) {
          if (message.id > latest_id) {
            insertHTML += buildHTML(message);
            $('.contents__body__messeage-list').append(insertHTML);
            $('.contents__body').animate( {scrollTop: $('.contents__body__messeage-list')[0].scrollHeight} );
          }
        });
      })

      .fail(function(messages){
        alert("失敗");
      })

    }
  }

  setInterval(autoUpdate, 5000);

});
