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
//= require header
//= require summernote/summernote-bs4.min
//= require summernote-init
//= require tag-it
//= require rails-ujs
//= require activestorage
//= require_tree .


// Japan-Map 用
$(document).ready(function(){
        var areaLinks = {
         1:"articles/?option=1&search=北海道",
         2:"articles/?option=1&search=青森",
         3:"articles/?option=1&search=岩手",
         4:"articles/?option=1&search=宮城",
         5:"articles/?option=1&search=秋田",
         6:"articles/?option=1&search=山形",
         7:"articles/?option=1&search=福島",
         8:"articles/?option=1&search=茨城",
         9:"articles/?option=1&search=栃木",
         10:"articles/?option=1&search=群馬",
         11:"articles/?option=1&search=埼玉",
         12:"articles/?option=1&search=千葉",
         13:"articles/?option=1&search=東京",
         14:"articles/?option=1&search=神奈川",
         15:"articles/?option=1&search=新潟",
         16:"articles/?option=1&search=富山",
         17:"articles/?option=1&search=石川",
         18:"articles/?option=1&search=福井",
         19:"articles/?option=1&search=山梨",
         20:"articles/?option=1&search=長野",
         21:"articles/?option=1&search=岐阜",
         22:"articles/?option=1&search=静岡",
         23:"articles/?option=1&search=愛知",
         24:"articles/?option=1&search=三重",
         25:"articles/?option=1&search=滋賀",
         26:"articles/?option=1&search=京都",
         27:"articles/?option=1&search=大阪",
         28:"articles/?option=1&search=兵庫",
         29:"articles/?option=1&search=奈良",
         30:"articles/?option=1&search=和歌山",
         31:"articles/?option=1&search=鳥取",
         32:"articles/?option=1&search=島根",
         33:"articles/?option=1&search=岡山",
         34:"articles/?option=1&search=広島",
         35:"articles/?option=1&search=山口",
         36:"articles/?option=1&search=徳島",
         37:"articles/?option=1&search=香川",
         38:"articles/?option=1&search=愛媛",
         39:"articles/?option=1&search=高知",
         40:"articles/?option=1&search=福岡",
         41:"articles/?option=1&search=佐賀",
         42:"articles/?option=1&search=長崎",
         43:"articles/?option=1&search=熊本",
         44:"articles/?option=1&search=大分",
         45:"articles/?option=1&search=宮崎",
         46:"articles/?option=1&search=鹿児島",
         47:"articles/?option=1&search=沖縄",
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

// 現在地の取得



// Google Maps API, 現在地, Montreal soft vintage

// function initMap() {
//     // 現在地を取得
//   navigator.geolocation.getCurrentPosition(function (position) {
//   LatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

//       // 取得した現在地を中心に表示
//   var map = new google.maps.Map(document.getElementById('map_test'), {
//     center: LatLng,
//     zoom: 7,
//     styles: [
//     {
//         "featureType": "all",
//         "elementType": "labels.text.fill",
//         "stylers": [
//             {
//                 "saturation": 36
//             },
//             {
//                 "color": "#3b332e"
//             },
//             {
//                 "lightness": "42"
//             }
//         ]
//     },
//     {
//         "featureType": "all",
//         "elementType": "labels.text.stroke",
//         "stylers": [
//             {
//                 "visibility": "on"
//             },
//             {
//                 "color": "#ffffff"
//             },
//             {
//                 "lightness": 16
//             }
//         ]
//     },
//     {
//         "featureType": "all",
//         "elementType": "labels.icon",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "administrative",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "landscape",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "color": "#c9bcac"
//             },
//             {
//                 "lightness": "80"
//             }
//         ]
//     },
//     {
//         "featureType": "poi",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "lightness": 21
//             }
//         ]
//     },
//     {
//         "featureType": "poi",
//         "elementType": "labels",
//         "stylers": [
//             {
//                 "visibility": "simplified"
//             },
//             {
//                 "lightness": "55"
//             }
//         ]
//     },
//     {
//         "featureType": "poi.park",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "color": "#d1e5d9"
//             },
//             {
//                 "lightness": "3"
//             }
//         ]
//     },
//     {
//         "featureType": "road.highway",
//         "elementType": "geometry.fill",
//         "stylers": [
//             {
//                 "color": "#ffffff"
//             },
//             {
//                 "lightness": 17
//             }
//         ]
//     },
//     {
//         "featureType": "road.highway",
//         "elementType": "geometry.stroke",
//         "stylers": [
//             {
//                 "color": "#ffffff"
//             },
//             {
//                 "lightness": 29
//             },
//             {
//                 "weight": 0.2
//             }
//         ]
//     },
//     {
//         "featureType": "road.arterial",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "color": "#ffffff"
//             },
//             {
//                 "lightness": 18
//             }
//         ]
//     },
//     {
//         "featureType": "road.local",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "color": "#ffffff"
//             },
//             {
//                 "lightness": 16
//             }
//         ]
//     },
//     {
//         "featureType": "transit",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "color": "#f2f2f2"
//             },
//             {
//                 "lightness": 19
//             }
//         ]
//     },
//     {
//         "featureType": "water",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "color": "#acc4ce"
//             },
//             {
//                 "visibility": "on"
//             }
//         ]
//     }
// ]
    
//     });

//   // 現在地にピンを立てる
//   var my_marker = new google.maps.Marker({
//     position: LatLng,
//     map: map,
//     icon: 'https://maps.google.com/mapfiles/ms/icons/blue-dot.png'
//     });
//   var tower_marker = new google.maps.Marker({
//     position: { lat: 36.04722222, lng: 138.1108333 },
//     map: map,
//     icon: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png'
//     });
//   });
// }

// Google Maps API, 現在地





// function initMap(){
//   for (var i = 0; i < @articles.length; i++) {
//     var article_map[i] = {lat: <%= @articles[i].latitude %>, lng: <%= @article.longitude %>};
//   }
//   let map = new google.maps.Map(document.getElementById('usermap'), {
//   center: { lat: 35.6585, lng: 139.7486 },
//   zoom: 13
//   });
// // article_mapの位置にマーカーを表示する
//   marker = new google.maps.Marker({
//     position: article_map,
//     map: map
//   });
// }



