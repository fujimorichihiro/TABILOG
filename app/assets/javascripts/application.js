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
//= require jquery.japan-map.min
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



$(document).on('turbolinks:load', function(){
        
        var areaLinks = {
         1:"articles/?option=1&search=東京",
         2:"articles",
         3:"articles",
         4:"articles",
         5:"articles",
         6:"articles",
         7:"articles",
         8:"articles",
         9:"articles"
        };
        
            var areas = [
                {code : 1, name: "", color: "#aaa", hoverColor: "#b3b2ee", prefectures: [1]},
                {code : 2, name: "", color: "#aaa", hoverColor: "#98b9ff", prefectures: [2]},
                {code : 3, name: "", color: "#aaa", hoverColor: "#98b9ff", prefectures: [3]},
                {code : 4, name: "", color: "#aaa", hoverColor: "#98b9ff", prefectures: [4]},
                {code : 5, name: "", color: "#aaa", hoverColor: "#98b9ff", prefectures: [5]},
                {code : 6, name: "", color: "#aaa", hoverColor: "#98b9ff", prefectures: [6]},
                {code : 7, name: "", color: "#aaa", hoverColor: "#98b9ff", prefectures: [7]},
                {code : 8, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [8]},
                {code : 9, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [9]},
                {code : 10, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [10]},
                {code : 11, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [11]},
                {code : 12, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [12]},
                {code : 13, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [13]},
                {code : 14, name: "", color: "#aaa", hoverColor: "#b7e5f4", prefectures: [14]},
                {code : 15, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [15]},
                {code : 16, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [16]},
                {code : 17, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [17]},
                {code : 18, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [18]},
                {code : 19, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [19]},
                {code : 20, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [20]},
                {code : 21, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [21]},
                {code : 22, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [22]},
                {code : 23, name: "", color: "#aaa", hoverColor: "#aceebb", prefectures: [23]},
                {code : 24, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [24]},
                {code : 25, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [25]},
                {code : 26, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [26]},
                {code : 27, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [27]},
                {code : 28, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [28]},
                {code : 29, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [29]},
                {code : 30, name: "", color: "#aaa", hoverColor: "#fff19c", prefectures: [30]},
                {code : 31, name: "", color: "#aaa", hoverColor: "#ffe0a3", prefectures: [31]},
                {code : 32, name: "", color: "#aaa", hoverColor: "#ffe0a3", prefectures: [32]},
                {code : 33, name: "", color: "#aaa", hoverColor: "#ffe0a3", prefectures: [33]},
                {code : 34, name: "", color: "#aaa", hoverColor: "#ffe0a3", prefectures: [34]},
                {code : 35, name: "", color: "#aaa", hoverColor: "#ffe0a3", prefectures: [35]},
                {code : 36, name: "", color: "#aaa", hoverColor: "#ffbb9c", prefectures: [36]},
                {code : 37, name: "", color: "#aaa", hoverColor: "#ffbb9c", prefectures: [37]},
                {code : 38, name: "", color: "#aaa", hoverColor: "#ffbb9c", prefectures: [38]},
                {code : 39, name: "", color: "#aaa", hoverColor: "#ffbb9c", prefectures: [39]},
                {code : 40, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [40]},
                {code : 41, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [41]},
                {code : 42, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [42]},
                {code : 43, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [43]},
                {code : 44, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [44]},
                {code : 45, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [45]},
                {code : 46, name: "", color: "#aaa", hoverColor: "#ffbdbd", prefectures: [46]},
                {code : 47, name: "", color: "#aaa", hoverColor: "#f5c9ff", prefectures: [47]},
            ];

            $("#map-container").japanMap({
            width:600,
            areas  : areas,
            selection : "area",
            borderLineWidth: 0.25,
            drawsBoxLine : false,
            movesIslands : true,
            showsAreaName : true,
            font : "MS Mincho",
            fontSize : 13,
            fontColor :"#777",
            fontShadowColor : "white",
            onSelect : function(data){
              location.href = areaLinks[data.area.code];
                }
            });

        });

