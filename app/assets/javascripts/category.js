$(document).ready(function(){
  $('.pc-header-nav h2').hover(function(){
    $(this).addClass('active');
    var children = $('.active').children('.header-category-list');
    children.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.header-category-list').hide();
  });

  $('.parent').hover(function(){
    $(this).addClass('active');
    var children = $('.active').children('.child-wrap');
    children.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.child-wrap').hide();
  });

  $('.child').hover(function(){
    $(this).addClass('active');
    var grandChild = $('.active').children('.grand-child-wrap');
    grandChild.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.grand-child-wrap').hide();

  });
}); 