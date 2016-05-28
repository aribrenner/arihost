$(function(){
  $('.hit-destroy-button').click(function(){
    $.ajax({
      url: this.dataset.url,
      method: 'DELETE',
      data: {
        hitable_type: this.dataset.hitableType
      },
      success: function (response) {
        var id = response.id;
        $(".js-hit-row[data-hit='"+id+"']").hide()
      }
    })
  });
})
