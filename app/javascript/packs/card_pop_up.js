$('.card-text').hide();

$('.card').on('click', function() {
  $(this).find(".card-text").toggle();
});