ariHost(function(){
  $('.hit-destroy-button').click(function(){
    $.ajax({
      url: this.dataset.url,
      method: 'DELETE',
      data: {
        hittable_type: this.dataset.hittableType
      },
      success: function (response) {
        var id = response.id;
        $(".js-hit-row[data-hit='"+id+"']").hide()
      }
    })
  });
})
