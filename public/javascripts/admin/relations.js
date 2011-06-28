document.observe('click', function(e) {
  var remove, link;
  
  if (remove = e.findElement('.remove-row')) {
    if ($$('.selector-row').length > 1)
      remove.up('.selector-row').remove();
    else
      remove.up('.selector-row').select('select').first().value = '';
 }
 
 if (e.findElement('.add-row')) {
   var new_row = $$('.selector-row').last().cloneNode(true);
   $$('.selector-row').last().insert({after: new_row})
   
   return false;
 }
})