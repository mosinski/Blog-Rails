var onEndless;

onEndless = function() {
  //var url;
  $(window).off('scroll', onEndless);
  var url = $('.pagination a.next_page').attr('href');
  if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
    $('center #info').html('<img src="/loading.gif" alt="Loading..." title="Loading..."/>');
    setTimeout(function (){
      return $.getScript(url, function() {
        return $(window).on('scroll', onEndless);
      });
    }, 1000);
  } else {
    return $(window).on('scroll', onEndless);
  }
};

jQuery(function() {
  if ($('#blog-pager').size() > 0) {
    $(window).on('scroll', onEndless);
  }
});

$(window).scroll();
