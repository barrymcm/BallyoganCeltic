// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


$(document).ready(function () {

    $(".thumbnail").on("click", function () {
        $("#info_container").show();
    });

    $("div a").on("click", function () {
        $("#info_container").hide();
    });

    $('ul.nav.nav-pills li a').click(function () {
        $(this).parent().addClass('active').siblings().removeClass('active');

    });

    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    })

    !function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0],
            p = /^http:/.test(d.location) ? 'http' : 'https';

        if (!d.getElementById(id)) {
            js = d.createElement(s);
            js.id = id;
            js.src = p + "://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);
        }
    }(document, "script", "twitter-wjs");


    //    $(".nav > li").on("click", function(){
//        $(".nav-pills > li.focus").addClass("active");
//    });
//    (function(d, s, id) {
//        var js, fjs = d.getElementsByTagName(s)[0];
//        if (d.getElementById(id)) return;
//        js = d.createElement(s); js.id = id;
//        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
//        fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));

// ----------- HighCharts API --------------------- //

// Created a dynamic JSON object on the teams page (top scorers)
// then parse it as a javascript object.

    // This hides the raw output from the li element that contains the JSON object
    $('#topScorers ul li').hide();

    var topScorersObject = $('#topScorers ul li').text();

    var topScorers = JSON.parse(topScorersObject);

    var string = 'barry';

    console.log(string.substr(0, 1));

    /*var i = 0;
     // Wont work because the goals are not being rendered on the page
     for(var i; i < goals.length; i++){
     scores.push( goals[i].innerHTML );
     console.log(scores);
     }*/

    $('#top_scorers').highcharts({
        chart:{
            type:'column',
            borderWidth: 3,
            borderWeight: 2,
            borderColor: '#228B22',
            spacingTop: 30,
            spacingBottom: 25
        },
        credits:{
            enabled: false
        },
        title:{
            text:null
        },
        tooltip: {
            useHTML: true,
            headerFormat: '<table><thead> <tr>' +
                '<th style="border-bottom: 2px solid #6678b1; color:#039;" >{point.key}</th></tr></thead>',
            pointFormat: '<tbody><tr><td style="color: {series.color}">{series.name}: </td>' +
                '<td><b>{point.y}</b></td></tr></tbody>',
            footerFormat: '</table>'
        },
        xAxis:{
            categories: topScorers.last_names,
            labels:{
                rotation:-55,
                x:5,
                y:15,
                align: 'right'
            }
        },
        yAxis:{
            title: null,
            tickInterval: 2,
            minorTickInterval: 1
        },
        legend: {
            enabled: false,
            VerticalAlign: 'bottom',
            layout: 'vertical'
        },
        plotOptions:{
            column:{
                colorByPoint: true
            }
        },
        series:[
            {
                name:"Goals",
                data: topScorers.goals
                // showInLegend: true
            }
        ]
    });


    $('#played').highcharts({

        chart:{
            type:'column',
            plotBorderWidth:2,
            plotBackgroundColor:'#D6D6EB',
            plotBorderColor:'#D8D8D8',
            plotShadow:true,
            spacingBottom:15,
            height:350
        },
        title:{
            text: null
        },
        credits:{
            enabled: false
        },
        legend: {
            enabled: false
        },
        xAxis: {
            categories: [ 'Games Played' ],
            tickLength: 0
        },
        yAxis: {
            title: {
                text: null
            },
            labels: {
                y: 5,
                x: 15
            },
            min: 0,
            max: 100,
            tickInterval: 20,
            minorTickInterval: 10,
            tickWidth: 1,
            tickLength: 8,
            minorTickLength: 5,
            minorTickWidth: 1,
            minorGridLineWidth: 0
        },
        series: [{
            borderColor: '#7070B8',
            borderRadius: 3,
            borderWidth: 1,
            color: {
                linearGradient:
                { x1: 0, y1: 0, x2: 1, y2: 0 },
                stops: [
                    [ 0, '#D6D6EB' ],
                    [ 0.3, '#5C5CAD' ],
                    [ 0.45, '#5C5C9C' ],
                    [ 0.55, '#5C5C9C' ],
                    [ 0.7, '#5C5CAD' ],
                    [ 1, '#D6D6EB'] ]
            },
            pointWidth: 50,
            data: [ 48.9 ]
        }]
    });
});
