// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets
//= require summernote/summernote-bs4.min
//= require summernote-init
//= require tag-it
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


// tag用

// (function() {
//   $(document).on('turbolinks:load', function() {
//     return $('#tag-form').tagit();
//   });

// }).call(this);

// (function() {
//   $(document).on('turbolinks:load', function() {
//     var category_list, category_string, error, tag, _i, _len, _results;
//     $('#tag-form').tagit({
//       fieldName: 'tag_list',
//       singleField: true
//     });
//     $('#tag-form').tagit();
//     tag_string = $("#tag_hidden").val();
//     try {
//       tag_list = tag_string.split(',');
//       _results = [];
//       for (_i = 0, _len = tag_list.length; _i < _len; _i++) {
//         tag = tag_list[_i];
//         _results.push($('#tag-form').tagit('createTag', tag));
//       }
//       return _results;
//     } catch (_error) {
//       error = _error;
//     }
//   });

// }).call(this);


