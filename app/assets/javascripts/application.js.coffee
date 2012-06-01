#  This is a manifest file that'll be compiled into including all the files listed below.
#  Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
#  be included in the compiled file accessible from http://example.com/assets/application.js
#  It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#  the compiled file.
#  
# = require jquery
# = require jquery_ujs
# = require bootstrap-modal
# = require bootstrap-dropdown
# = require_tree .

$ ->
  $('#node_form').on
    'ajax:beforeSend': (event, xhr, settings) ->
      c = $(this).find('[name="node[content]"]')
      c.focus() if c.attr('value').trim()==''
      $(this).attr("disabled", "true")
      c.attr("disabled", "disabled")
      $(this).find('[type=submit]').addClass('disabled')
       
      fly.start($('#node_content'), $('#nodes .node').first())
    'ajax:success':  (event, text, status) ->
      c = $(this).find('[name="node[content]"]')
      el = $(text).prependTo($('#nodes'))
      $(this).removeAttr("disabled")
      c.attr('value', '').removeAttr("disabled")
      $(this).find('[type=submit]').removeClass('disabled')
       
      fly.end(el)
    'ajax:error': (event, xhr, status) ->
      fly.clear -> alert('提交失败，'+xhr.responseText)
      c = $(this).find('[name="node[content]"]')
      $(this).removeAttr("disabled")
      c.removeAttr("disabled")
      $(this).find('[type=submit]').removeClass('disabled')

fly = do ->
  cp = box_to = null
  start: (el_from, el_to) ->
    el_from = $(el_from)
    el_to = $(el_to)
    cp = $('<div></div>').html(el_from.val()).appendTo($('body'))
      .css('position','absolute').css
        'left': el_from.offset().left+parseInt(el_from.css('padding-left'))+
          parseInt(el_from.css('border-left'))+1
        'top': el_from.offset().top+parseInt(el_from.css('padding-top'))+
          parseInt(el_from.css('border-top'))
        'line-height':'normal'
        'font-size':el_from.css('font-size')
        'color':el_from.css('color')
 
    new_el = el_to.find('.node_content a')

    cp.css('text-align', new_el.css('text-align'))
    cp.animate($.extend(new_el.offset(),
      'font-size': new_el.css('font-size')
      'color': new_el.css('color')
      'width': new_el.css('width')
      'padding': new_el.css('padding')
    ), 500)

    box_to = el_to.clone().insertBefore(el_to)
    box_to.find('.node_content a').html('&nbsp;')
    box_to.find('.node_op').html('提交中')
    box_to.animate({'height': 'toggle'}, 0)
    box_to.animate({'height': 'toggle'})
  end: (el) ->
    el.hide()
    box_to.queue ->
      el.show().animate(opacity: 0, 0)
      cp.fadeOut -> $(this).remove()
      el.animate(opacity: 100)
      $(this).remove()
  clear: (callback) ->
    cp.fadeOut -> $(this).remove()
    box_to.fadeOut ->
      callback()
      $(this).remove()
