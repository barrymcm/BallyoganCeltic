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
            spacingBottom: 25,
            height: 250
        },
        credits:{
            enabled: false
        },
        title:{
            text:'Top Scorers'
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
            tickInterval: 5,
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


    var totalPlayedObject = $('#played ul li').text();

    console.log(totalPlayedObject);

    var totalPlayed = JSON.parse(totalPlayedObject);

    console.log(totalPlayed.total_played);

    $('#played ul li').hide();

    $('#total_played').highcharts({

        chart:{
            type:'pie',
            borderWidth: 3,
            borderWeight: 2,
            borderColor: '#228B22',
            spacingTop: 30,
            spacingBottom: 25,
            height: 250
        },
        title:{
            text: 'Seasons Games'
        },
        legend: {
            align: 'center',
            layout: 'horizontal',
            verticalAlign: 'top',
            itemMarginBottom: 4,
            itemMarginTop: 4,
            x:0,
            y:30
        },
        credits:{
            enabled: false
        },
        plotOptions: {
            pie: {
                showInLegend: true,
                dataLabels: {
                    distance: -15,
                    color: 'white',
                    style: {
                        fontWeight: 'bold'
                    }
                }
            }
        },
        series: [{
            data: [15,3]
        }]
    });
});
