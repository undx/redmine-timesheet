function targetField(label_element) {
  return  $(label_element.attributes.for.value);
}

function selectAllOptions(element) {
  for (var i = 0; i < element.options.length; i++) {
    element.options[i].selected = true;
  }
}

$(function() {
  $('label.select_all').each(function(element) {
      Event.observe(element, 'click', function (e) { selectAllOptions(targetField(this)); });
  });
});
