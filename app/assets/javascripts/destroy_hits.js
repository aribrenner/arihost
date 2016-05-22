$(function(){

  $('.hit-destroy-button').click(function(){
    // debugger
    $.ajax({
      url: this.dataset.url,
      method: 'DELETE',
      data: {
        hitable_type: this.dataset.hitableType
      },
      success: function () {
        console.log('dead')
      }
    })
  });
})
