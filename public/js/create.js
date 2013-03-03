
$(function () {
    $('#find-track input').typeahead({
	  source: {
	    url: '/search',
	    type: 'GET',
	    dataType: 'json',
	    beforeSend: function () {
	      $('.progress').show();
	    },
	    complete: function () {
	      $('.progress').hide();
	    }
	  },
	  val: 'key',
	  minLength: 3,
	  tmpl: _.template('<li id="<%= key %>"><a href="#"><img src="<%= icon %>" width="60" height="60" style="margin-right:5px"><%= artist %> - <%= name %></a></li>'),
	  itemSelected: function () {
	  }
  	});
    
    
    
});