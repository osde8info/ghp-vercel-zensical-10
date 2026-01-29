<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/assets/2.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
    <link rel="stylesheet" href="/assets/clustrmaps/css/flags32.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <link rel="stylesheet" media="all" href="/assets/clustrmaps/jvectormap/jquery-jvectormap-2.0.2.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/odometer/0.4.7/themes/odometer-theme-minimal.css">
    <link rel="canonical" href="https://clustrmaps.com/site/2d"/>
    <script defer data-domain="clustrmaps.com" src="https://plaucible.hlyboke.review/js/script.hash.outbound-links.pageview-props.revenue.tagged-events.js"></script>
<script defer data-id="3" src="https://clustrmaps.com/bl/scripts/counter.js"></script>

<script>
    window.plausible = window.plausible || function() { (window.plausible.q = window.plausible.q || []).push(arguments) };
    plausible('pageview', {props: {languages: navigator.languages.toString()}});
</script>    <style>

        /* LEAFLET MAP MARKERS */

        .circle {
            border-radius: 50%;
            width: 8px;
            height: 8px;
            display: inline-block;
            background: #da0707;
            margin-right: 2px;
        }

        .sub1 {
            top: 0em;
            margin-top: 41px;
            position: absolute;
        }

        /* HEATMAP */
        #heat-fill {
            display: block;
            position: relative;
            margin-bottom: 20px;
            background: #333;
            height: 7px;
            width: 200px;
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAABCAIAAAAU3Xa1AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NjRBMTA1NEI3MEQ1MTFFNjkwQ0RDMzJFQUQ5NEUxQkIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NjRBMTA1NEM3MEQ1MTFFNjkwQ0RDMzJFQUQ5NEUxQkIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2NEExMDU0OTcwRDUxMUU2OTBDREMzMkVBRDk0RTFCQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2NEExMDU0QTcwRDUxMUU2OTBDREMzMkVBRDk0RTFCQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pijkny4AAACySURBVHjapFJbDsMwCANp979xYLbBafe9pqFgwDzUT3fHHw+ywVDBW6NDFs68RE4NEqdKUi7IitOSRQfCKLsYcMBGBK5DF8Na9XqKUpeVlEJwcqCeqRT2qGPCAFUO0SJt6qvzVoh8ZxSYZffSanlrorq/ynVScDOOvWy5Nfsu0nPFu+k7abzazPjt+Zqx5izBRJoivbCnFcPsNrZ9RQ9Nmszxabp4/zXQU0PntqC8rwADAIFVENILmYNHAAAAAElFTkSuQmCC);
        }

        .fill-a, .fill-b {
            width: 20px;
            text-align: right;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            background: #fff;
            padding-right: 4px;
            position: absolute;
            left: 0;
            font-size: 12px;
            line-height: 20px;
            margin-top: -7px;
            font-weight: 700;
        }

        .fill-b {
            text-align: left;
            position: absolute;
            right: 0;
            left: auto;
            top: 0;
            width: 60px;
            padding-left: 4px;
            padding-right: 0;
        }

        .jqstooltip {
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }

        .audience > tbody > tr > td {
            line-height: 32px;
        }

        /* Bootstrap */

        .hpanel {
            background-color: none;
            border: none;
            box-shadow: none;
            margin-top: 30px;
        }

        .hbuilt {
            background: #fff;
            border-color: #e4e5e7;
            border: 1px solid #e4e5e7;
            padding: 10px 10px;
            border-radius: 2px;
            font-weight: 200;
        }

        .hbuilt strong {
            font-weight: 500;
            color: black;
        }

        .hpanel > .panel-heading {
            color: inherit;
            font-weight: 200;
            font-size: 17px;
            padding: 10px;

        }

        .hpanel .hbuilt.panel-heading {
            border-bottom: none;
        }

        .hpanel .panel-body {
            background: #fff;
            border: 1px solid #e4e5e7;
            border-radius: 2px;
            padding: 20px;
            position: relative;
        }

        .hpanel > .panel-footer {
            color: inherit;
            border: 1px solid #e4e5e7;
            border-top: none;
            font-size: 90%;
            background: #f7f9fa;
            padding: 10px 15px;
        }

        .panel-heading {
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }


        .red {
            background: red;
        }

        .yellow {
            background: yellow;
        }

        .gold {
            background: linear-gradient(#fee6b0 0%, #eeba37 100%) repeat scroll 0 0 #eeba37;
        }

        .sblue, sblue.hover {
            background: #3398D7 !important;
            color: white !important;
            font-weight: 400;
            font-size: 17px;
            padding: 11px !important;
            top: 4px;
        }

        .gold:hover, gold:active, .gold:focus {
            background-color: #eeba37;
            background-image: linear-gradient(#fede97 0%, #ecb21f 100%);
        }

        .font-extra-bold {
            font-weight: 700;
        }

        .country {
            line-height: 32px;
            font-weight: 200;
            font-size: 16px;
            margin-left: 5px;
        }

        /*SPARKLINE*/
        .shr {
            margin-top: 2px;
            margin-bottom: 2px
        }

        .ssp {
            text-align: center;
            font-weight: 600
        }

        /*RECENT TABLE*/
        .tdc {
            text-align: center
        }

        .timeago {
            border-bottom: 1px dotted #ccc
        }

        @keyframes newTR {
            0% {
                background: rgba(55, 173, 0, 0.2);

            }
            100% {
                background: white;
            }
        }

        .newtr {
            animation: newTR 5s;
            /*animation-delay: 3s;*/
            animation-fill-mode: forwards;
        }

        .mch {
            height: 200px;
        }

        #recent-visits td {
            vertical-align: middle;
        }

        .dot {
            display: inline-block;
            background-color: rgb(255, 0, 0);
            vertical-align: middle;
            height: 9px;
            width: 9px;
            border-radius: 50%;
            margin-left: 10px;
        }

        .dot.recent {
            background-color: #F8A400;
        }

                .pageURL {
            float: left;
            width: 260px;
            overflow: hidden;
            clear: left;
            text-align: right;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .cntP {
            font-weight: 400;
        }

        .flag {
            vertical-align: initial !important;
        }

        .vstor {
            float: left;
            line-height: 32px;
        }

        .icon_os {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-repeat: no-repeat;
            background-position: center center;
            vertical-align: middle;
            margin-right: 5px;
        }

        .icon_win10 {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABx0lEQVQ4y5VRPW8TQRSc2V1fsImC7RjxWUCIEpsCiZaWFgnRUvM3EL+Ckj/BX4CGhgqCQkcUhUSxcJDj+G7vdofiLmdjOUS84nR6+2bemxliST37MDQ+RBLAzsS6Wy1rn3R5/ftJvnXoORh5PPDgoIjY5ouPw+bXMdonORu9plltW90d5epfNVprGe3vntnXhbAxLgAfCUAAWC9zRxmfj3K88eKNHxN1vgVAMmg7Hawn4d1Rxo1qVqBYglW1CPcz471jz/6cAgGgqDNDhGqu+rIG1hfg76HyTyWNiEvL8Xyp5tsV8pxBugBOuBhpZttn+gg0CNjycFN15w0sO+7RWvy82uBbSxRWiqdFnAhUr6FfYvEpW+Ekj/Iyig6iM0SDQmIsDAQ39OwfpnxpjVICghjSIA9gr3fFxqn4yhlGCGEakRYBBSBZADQG7iBFc+jRWXQ4IJpAdY8zbi7TXptoOBM9H6QBwtK3xRQ0Zwgum14ao5AAXIixTK4mFy/kdY87eJ+YoNPA+wHc8hGbecTtFapDIQGJhSMr6vLB3Wnxy9iHnf3UMo0waQAfrifu6TV/c/e3mlQ48eDAR24HoT/O0Z3q/2T+s/4AH1XSLh6pxbIAAAAASUVORK5CYII=);
        }

        .icon_osx {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAByklEQVQ4y6WT34tMcRjGP+/3nPnBGDss7LLRxCqNrW1RqZSiTW2kKEWikorWHfwJ1N65UqlUW7mTSlFcW1GCzRVZUpvdydjZPXO+55zv62bP7NQYpjx3p+c8z/t8n7cXusPqToTpQrwNuPon4vb998ixS68MMASsA7T1hzCoMfX4wrUT565PDu0f/ZbEUTrQAdM3zu+Z95fj3QEOqq7oRaA2N83RU+PsHj40FkcWEUnpGDgJPDKAAlHK1H8uEYUxqtD49YbByj5EDB9eP8N4XjNcmratg4VqnSiMCYN5etZaSr1bERHevnyC52X+XqKIsGXHZorre/j+6SmVkcM453Au4eyVCWwYdLcFMT4/vr5goFwhiS2ooqqtHbQbqCpI8wPPz/Nw8i73JsaxNmgm7GggRlioLqIKSRyw98gt+gYvg9dLJrsKMYZadRbnElq35TcNEBZrS3x+N0OxVCC/JocI2CBg6vkD5mZnsFGD42duksnm2g2cc/SXN9Ff3khQD7ENi0tAPJ/tu0YYPjBGsbSBOLKoqqTP8QEBfBHBOYeIkC/kyBdyGC/Ll49Z+gZ2YoyXihGRDCuN/ROngdFOt9AN8sBF/hMdr/Y3TTSpQO0Al2AAAAAASUVORK5CYII=);
        }

        .icon_chrome {
            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIxIDEgMTc2IDE3NiI+PGRlZnM+PGNpcmNsZSBpZD0iYSIgY3k9Ijk2IiBjeD0iOTYiIHI9Ijg4Ii8+PC9kZWZzPjxjbGlwUGF0aCBpZD0iYiI+PHVzZSB3aWR0aD0iMTAwJSIgb3ZlcmZsb3c9InZpc2libGUiIHhsaW5rOmhyZWY9IiNhIiBoZWlnaHQ9IjEwMCUiLz48L2NsaXBQYXRoPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgY2xpcC1wYXRoPSJ1cmwoI2IpIj48cGF0aCBkPSJNMjEuOTcgOHYxMDhoMzkuMzlMOTYgNTZoODhWOHoiIGZpbGw9IiNkYjQ0MzciLz48bGluZWFyR3JhZGllbnQgaWQ9ImMiIHkyPSI0NC4zNTQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiB5MT0iNzUuMDIxIiB4Mj0iODEuODM3IiB4MT0iMjkuMzM3Ij48c3RvcCBzdG9wLWNvbG9yPSIjQTUyNzE0IiBzdG9wLW9wYWNpdHk9Ii42IiBvZmZzZXQ9IjAiLz48c3RvcCBzdG9wLWNvbG9yPSIjQTUyNzE0IiBzdG9wLW9wYWNpdHk9IjAiIG9mZnNldD0iLjY2Ii8+PC9saW5lYXJHcmFkaWVudD48cGF0aCBkPSJNMjEuOTcgOHYxMDhoMzkuMzlMOTYgNTZoODhWOHoiIGZpbGw9InVybCgjYykiLz48L2c+PHBhdGggY2xpcC1wYXRoPSJ1cmwoI2IpIiBmaWxsLW9wYWNpdHk9Ii4xNSIgZD0iTTYyLjMxIDExNS42NUwyMi40OCA0Ny4zNGwtLjU4IDEgMzkuNTQgNjcuOHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgZmlsbD0iIzNlMjcyMyIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgY2xpcC1wYXRoPSJ1cmwoI2IpIj48cGF0aCBkPSJNOCAxODRoODMuNzdsMzguODgtMzguODhWMTE2SDYxLjM2TDggMjQuNDh6IiBmaWxsPSIjMGY5ZDU4Ii8+PGxpbmVhckdyYWRpZW50IGlkPSJkIiB5Mj0iMTMwLjMzIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeTE9IjE2NC41IiB4Mj0iNTIuNTM4IiB4MT0iMTEwLjg3Ij48c3RvcCBzdG9wLWNvbG9yPSIjMDU1NTI0IiBzdG9wLW9wYWNpdHk9Ii40IiBvZmZzZXQ9IjAiLz48c3RvcCBzdG9wLWNvbG9yPSIjMDU1NTI0IiBzdG9wLW9wYWNpdHk9IjAiIG9mZnNldD0iLjMzIi8+PC9saW5lYXJHcmFkaWVudD48cGF0aCBkPSJNOCAxODRoODMuNzdsMzguODgtMzguODhWMTE2SDYxLjM2TDggMjQuNDh6IiBmaWxsPSJ1cmwoI2QpIi8+PC9nPjxwYXRoIGNsaXAtcGF0aD0idXJsKCNiKSIgZmlsbC1vcGFjaXR5PSIuMTUiIGQ9Ik0xMjkuODQgMTE3LjMzbC0uODMtLjQ4TDkwLjYyIDE4NGgxLjE1bDM4LjEtNjYuNjR6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNyAtNykiIGZpbGw9IiMyNjMyMzgiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNyAtNykiIGNsaXAtcGF0aD0idXJsKCNiKSI+PGRlZnM+PHBhdGggaWQ9ImUiIGQ9Ik04IDE4NGg4My43N2wzOC44OC0zOC44OFYxMTZINjEuMzZMOCAyNC40OHoiLz48L2RlZnM+PGNsaXBQYXRoIGlkPSJmIj48dXNlIHdpZHRoPSIxMDAlIiBvdmVyZmxvdz0idmlzaWJsZSIgeGxpbms6aHJlZj0iI2UiIGhlaWdodD0iMTAwJSIvPjwvY2xpcFBhdGg+PGcgY2xpcC1wYXRoPSJ1cmwoI2YpIj48cGF0aCBkPSJNOTYgNTZsMzQuNjUgNjAtMzguODggNjhIMTg0VjU2eiIgZmlsbD0iI2ZmY2Q0MCIvPjxsaW5lYXJHcmFkaWVudCBpZD0iZyIgeTI9IjExNC4xMyIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiIHkxPSI0OS44MDQiIHgyPSIxMzYuNTUiIHgxPSIxMjEuODYiPjxzdG9wIHN0b3AtY29sb3I9IiNFQTYxMDAiIHN0b3Atb3BhY2l0eT0iLjMiIG9mZnNldD0iMCIvPjxzdG9wIHN0b3AtY29sb3I9IiNFQTYxMDAiIHN0b3Atb3BhY2l0eT0iMCIgb2Zmc2V0PSIuNjYiLz48L2xpbmVhckdyYWRpZW50PjxwYXRoIGQ9Ik05NiA1NmwzNC42NSA2MC0zOC44OCA2OEgxODRWNTZ6IiBmaWxsPSJ1cmwoI2cpIi8+PC9nPjwvZz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNyAtNykiIGNsaXAtcGF0aD0idXJsKCNiKSI+PHBhdGggZD0iTTk2IDU2bDM0LjY1IDYwLTM4Ljg4IDY4SDE4NFY1NnoiIGZpbGw9IiNmZmNkNDAiLz48cGF0aCBkPSJNOTYgNTZsMzQuNjUgNjAtMzguODggNjhIMTg0VjU2eiIgZmlsbD0idXJsKCNnKSIvPjwvZz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNyAtNykiIGNsaXAtcGF0aD0idXJsKCNiKSI+PGRlZnM+PHBhdGggaWQ9ImgiIGQ9Ik05NiA1NmwzNC42NSA2MC0zOC44OCA2OEgxODRWNTZ6Ii8+PC9kZWZzPjxjbGlwUGF0aCBpZD0iaSI+PHVzZSB3aWR0aD0iMTAwJSIgb3ZlcmZsb3c9InZpc2libGUiIHhsaW5rOmhyZWY9IiNoIiBoZWlnaHQ9IjEwMCUiLz48L2NsaXBQYXRoPjxnIGNsaXAtcGF0aD0idXJsKCNpKSI+PHBhdGggZD0iTTIxLjk3IDh2MTA4aDM5LjM5TDk2IDU2aDg4Vjh6IiBmaWxsPSIjZGI0NDM3Ii8+PHBhdGggZD0iTTIxLjk3IDh2MTA4aDM5LjM5TDk2IDU2aDg4Vjh6IiBmaWxsPSJ1cmwoI2MpIi8+PC9nPjwvZz48cmFkaWFsR3JhZGllbnQgaWQ9ImoiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiBjeT0iNTUuOTQ4IiBjeD0iNjY4LjE4IiBncmFkaWVudFRyYW5zZm9ybT0idHJhbnNsYXRlKC01NzYpIiByPSI4NC4wNzgiPjxzdG9wIHN0b3AtY29sb3I9IiMzRTI3MjMiIHN0b3Atb3BhY2l0eT0iLjIiIG9mZnNldD0iMCIvPjxzdG9wIHN0b3AtY29sb3I9IiMzRTI3MjMiIHN0b3Atb3BhY2l0eT0iMCIgb2Zmc2V0PSIxIi8+PC9yYWRpYWxHcmFkaWVudD48cGF0aCBjbGlwLXBhdGg9InVybCgjYikiIGQ9Ik05NiA1NnYyMC45NUwxNzQuNCA1NnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgZmlsbD0idXJsKCNqKSIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgY2xpcC1wYXRoPSJ1cmwoI2IpIj48ZGVmcz48cGF0aCBpZD0iayIgZD0iTTIxLjk3IDh2NDAuMzRMNjEuMzYgMTE2IDk2IDU2aDg4Vjh6Ii8+PC9kZWZzPjxjbGlwUGF0aCBpZD0ibCI+PHVzZSB3aWR0aD0iMTAwJSIgb3ZlcmZsb3c9InZpc2libGUiIHhsaW5rOmhyZWY9IiNrIiBoZWlnaHQ9IjEwMCUiLz48L2NsaXBQYXRoPjxnIGNsaXAtcGF0aD0idXJsKCNsKSI+PHBhdGggZD0iTTggMTg0aDgzLjc3bDM4Ljg4LTM4Ljg4VjExNkg2MS4zNkw4IDI0LjQ4eiIgZmlsbD0iIzBmOWQ1OCIvPjxwYXRoIGQ9Ik04IDE4NGg4My43N2wzOC44OC0zOC44OFYxMTZINjEuMzZMOCAyNC40OHoiIGZpbGw9InVybCgjZCkiLz48L2c+PC9nPjxyYWRpYWxHcmFkaWVudCBpZD0ibSIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiIGN5PSI0OC41MiIgY3g9IjU5Ny44OCIgZ3JhZGllbnRUcmFuc2Zvcm09InRyYW5zbGF0ZSgtNTc2KSIgcj0iNzguMDQ0Ij48c3RvcCBzdG9wLWNvbG9yPSIjM0UyNzIzIiBzdG9wLW9wYWNpdHk9Ii4yIiBvZmZzZXQ9IjAiLz48c3RvcCBzdG9wLWNvbG9yPSIjM0UyNzIzIiBzdG9wLW9wYWNpdHk9IjAiIG9mZnNldD0iMSIvPjwvcmFkaWFsR3JhZGllbnQ+PHBhdGggY2xpcC1wYXRoPSJ1cmwoI2IpIiBkPSJNMjEuOTcgNDguNDVsNTcuMjUgNTcuMjRMNjEuMzYgMTE2eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcgLTcpIiBmaWxsPSJ1cmwoI20pIi8+PHJhZGlhbEdyYWRpZW50IGlkPSJuIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgY3k9Ijk2LjEzOCIgY3g9IjY3MS44NCIgZ3JhZGllbnRUcmFuc2Zvcm09InRyYW5zbGF0ZSgtNTc2KSIgcj0iODcuODciPjxzdG9wIHN0b3AtY29sb3I9IiMyNjMyMzgiIHN0b3Atb3BhY2l0eT0iLjIiIG9mZnNldD0iMCIvPjxzdG9wIHN0b3AtY29sb3I9IiMyNjMyMzgiIHN0b3Atb3BhY2l0eT0iMCIgb2Zmc2V0PSIxIi8+PC9yYWRpYWxHcmFkaWVudD48cGF0aCBjbGlwLXBhdGg9InVybCgjYikiIGQ9Ik05MS44MyAxODMuODlsMjAuOTYtNzguMkwxMzAuNjUgMTE2eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcgLTcpIiBmaWxsPSJ1cmwoI24pIi8+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcgLTcpIiBjbGlwLXBhdGg9InVybCgjYikiPjxjaXJjbGUgY3k9Ijk2IiBjeD0iOTYiIHI9IjQwIiBmaWxsPSIjZjFmMWYxIi8+PGNpcmNsZSBjeT0iOTYiIGN4PSI5NiIgcj0iMzIiIGZpbGw9IiM0Mjg1ZjQiLz48L2c+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcgLTcpIiBjbGlwLXBhdGg9InVybCgjYikiPjxwYXRoIGZpbGwtb3BhY2l0eT0iLjIiIGQ9Ik05NiA1NWMtMjIuMDkgMC00MCAxNy45MS00MCA0MHYxYzAtMjIuMDkgMTcuOTEtNDAgNDAtNDBoODh2LTFIOTZ6IiBmaWxsPSIjM2UyNzIzIi8+PHBhdGggZmlsbC1vcGFjaXR5PSIuMSIgZD0iTTEzMC42IDExNmMtNi45MiAxMS45NC0xOS44MSAyMC0zNC42IDIwLTE0LjggMC0yNy42OS04LjA2LTM0LjYxLTIwaC0uMDRMOCAyNC40OHYxTDYxLjM2IDExN2guMDRjNi45MiAxMS45NCAxOS44MSAyMCAzNC42MSAyMCAxNC43OSAwIDI3LjY4LTguMDUgMzQuNi0yMGguMDV2LTFoLS4wNnoiIGZpbGw9IiNmZmYiLz48cGF0aCBvcGFjaXR5PSIuMSIgZD0iTTk3IDU2Yy0uMTcgMC0uMzMuMDItLjUuMDNDMTE4LjM2IDU2LjMgMTM2IDc0LjA4IDEzNiA5NnMtMTcuNjQgMzkuNy0zOS41IDM5Ljk3Yy4xNyAwIC4zMy4wMy41LjAzIDIyLjA5IDAgNDAtMTcuOTEgNDAtNDBzLTE3LjkxLTQwLTQwLTQweiIgZmlsbD0iIzNlMjcyMyIvPjxwYXRoIGZpbGwtb3BhY2l0eT0iLjIiIGQ9Ik0xMzEgMTE3LjMzYzMuNC01Ljg4IDUuMzctMTIuNjggNS4zNy0xOS45NiAwLTQuMjItLjY2LTguMjgtMS44Ny0xMi4wOS45NSAzLjQyIDEuNSA3LjAxIDEuNSAxMC43MyAwIDcuMjgtMS45NyAxNC4wOC01LjM3IDE5Ljk2bC4wMi4wNC0zOC44OCA2OGgxLjE2bDM4LjA5LTY2LjY0LS4wMi0uMDR6IiBmaWxsPSIjZmZmIi8+PC9nPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgY2xpcC1wYXRoPSJ1cmwoI2IpIj48cGF0aCBmaWxsLW9wYWNpdHk9Ii4yIiBkPSJNOTYgOWM0OC40MyAwIDg3LjcyIDM5LjEzIDg3Ljk5IDg3LjUgMC0uMTcuMDEtLjMzLjAxLS41IDAtNDguNi0zOS40LTg4LTg4LTg4UzggNDcuNCA4IDk2YzAgLjE3LjAxLjMzLjAxLjVDOC4yOCA0OC4xMyA0Ny41NyA5IDk2IDl6IiBmaWxsPSIjZmZmIi8+PHBhdGggZmlsbC1vcGFjaXR5PSIuMTUiIGQ9Ik05NiAxODNjNDguNDMgMCA4Ny43Mi0zOS4xMyA4Ny45OS04Ny41IDAgLjE3LjAxLjMzLjAxLjUgMCA0OC42LTM5LjQgODgtODggODhTOCAxNDQuNiA4IDk2YzAtLjE3LjAxLS4zMy4wMS0uNUM4LjI4IDE0My44NyA0Ny41NyAxODMgOTYgMTgzeiIgZmlsbD0iIzNlMjcyMyIvPjwvZz48cmFkaWFsR3JhZGllbnQgaWQ9Im8iIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiBjeT0iMzIuMDE0IiBjeD0iMzQuMjg2IiBncmFkaWVudFRyYW5zZm9ybT0idHJhbnNsYXRlKC03IC03KSIgcj0iMTc2Ljc1Ij48c3RvcCBzdG9wLWNvbG9yPSIjZmZmIiBzdG9wLW9wYWNpdHk9Ii4xIiBvZmZzZXQ9IjAiLz48c3RvcCBzdG9wLWNvbG9yPSIjZmZmIiBzdG9wLW9wYWNpdHk9IjAiIG9mZnNldD0iMSIvPjwvcmFkaWFsR3JhZGllbnQ+PGNpcmNsZSBjeT0iODkiIGN4PSI4OSIgcj0iODgiIGZpbGw9InVybCgjbykiLz48L3N2Zz4=);
        }

        .icon_win7 {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADdElEQVQYGQWAyW9UZQDAf9/3lnnb9L1582Yp3aCUSpUClVBEDyixHkyMF0wMFyMxMR64eMCL8R8wJp70QIKeJCqEg0nFkngQxARZG0yVARG6AKXTYaad7c1bjPC37yeKInqdDYyMTorYPVAePLJ1YPu0bZtjUgi1HXbuLz9eulG5+885XdMvmobG1pEhgiCPmqYpaZrSC0O9VOz/ZGLn5PEtxXLB0HQEKSkKkmSkmA9e9fOlD+/eq3zb2lj7TAiqpCmKWxqh1+vprl/8emr31MdvvXHI9gObVBPYroPtmriuSdH3GB8d1vLF4v4Hi6tTtqmd9/1cS1ViyFreCb84eEyV8NrhaYqORauxQSoFmhRs9iSQUC6V+OrUaWTGnqk1489zzeYxdTOMdjmWe2L98WO8fTtIbl2j8t1JzEKKmRfMNTNczKQcfOFNSvkd/Dh3GsWA6lPeS8LlM1KzjXc7SZStd7poukV6aZaBzUsMbL+FUfiTheo8k9MeB16a4PztU3QKSyT0aG/GdDGOyl6kHJSaidZXpnLhV5Zv/Ma//R4PLXjkCZyJcY4ePsFaY4HI/Yug4LFRV1Esh412+LyqoG/LmH3osWQtSfnGfR0nGKX8pEHtwSVmjhzF1C0WWz/jB1n+vmIgYh+7z6TTWvNVXbMUTe9DdltEw3tZPvAyM3uHmRwKuHJhH6ODu5idneX6whPiENor/YjsFjJaBFEkVMfOPYxQhhPTwrQLyHbIo2oVK2nwyovjlPol9aWrjD73jPipwj0tYMnsIxJdbDOsyz7HuJZKFT3rEnYTnq2scqdSpbK0zvhoCT26zvT4VQ5MrqNENmtRHtvxSKRB1lLvyiiOflB0MzJMH6INOtVFKvM3yUoYLrkYK2fR7i/AzZDL//VTzxSxLBdTNTCtzFl1bGLs8vJ67+RmZH5kZk2kJRFJxNT4EGrc5Pf5GtbqMIubW/mjsws9HyBaCTmHOd/1zqi5vI+iNT9drIux0Alm8Ey25FQOTQ5Sb3X5YuVtnjU7dOMcseNhdUHGa7eHrPS4ldHbyrY9M6iq0rbU8BcUCl3D2eMHjthZULnzpMZ80yP2RkitPCSCbLg+W1brHxgy/kckCaqUgiQBKcVqoHffd2TtXNLovfPlXGNCNTOBrlvCSno1KRoV0tpPptL6XktlN+6BAP4HAdJcb0jL9mwAAAAASUVORK5CYII=);
        }

        .icon_firefox {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADKUlEQVR42lWTT2yTdRiAn9/v+9p+XVtaWrfCsrRlqJsohiiY4KKCAUcgmBiTZQY8qaJ6UDUxsERMPIAHr3jg6MGgUcNBTBQ0hOF0kSI61jo2wdZlltm1Xdu1X/v9+TnEEXxO7+V5Lu/7CqUU7xvaZ8DRg6aTjvTt2dzfKLwQcFqPpkPJLm4yAZwFvgQuAFSmTgEg/gsogK9i9x0peQLD+wvjvQD7TAcBDO37gIPP1pn55Af33M+NMzuLF9+rFc3vAeSyvB/g+ZEIuxcuj9yQb8wAuRbk6w6Hj73GW8f9DL6Ykq8/pZ5wAsEzqYeiQwBSCLZFYxoATw9HSSY9rHA+rPFmxMtktcXQgd08/m6K3r397Hj7XqNWk8c37OlcIzUpHlx3l6fdyNu4lSabt4Zuxf4NSqiiU07cifJ5+XgsQurhOLGEP1y/bh2SHp/o7u7RvFbTJZDyANBcjHPHruf4/EQJdbrCLxcXuHzuD1w0MjNtFhdt+nbGWCqa23WlWBWISHQpaNQkwUfWA6B7MgDMTRcoZ7LU5grYrk46K/FLh3jSYKns9Ost0/Vhg7FWMvpNDevbC8wVFABHBj/E+uhThHKWJZemKYinGkRWlSg3GphVW5c+j6jXFhUIiMY1OkMua5djACNfv8IXW7/j8JYc1fki7WqZx3ryUC5R/+06/qBo6Br8+lfeGgit1rh7g8GfEzYbkzr3bzEIGDbjub/h5FnsnpdI+PMc2JSlVWgze76MJtwJ3XbUiemJ9gPhmO7vShj0bIxitx3SPy6R+70NTHIo8AwDHVO8vGuBmNaiMl0h85OGNxI9LY76ZNCvMaoLsWn7cAjDp+M4OtLQuFb2UqyadIglEl0WqZSPJjrZsTpXc/7qmkRnn7ZDF+2m4hLw5OxkO2B0CDr8DtKyiXmarA+axA3wuhKEInfFZipjmcWZ5rb5q6UrOsA7pjO+fNKDbaFOpcca3bGgpLfPSzgqaPoBD8zPWuRGBappN4rz7gBw6dYzrXAsqK9zBW+4Su11pEg5tgIBhk+wOixNx1In6xU18mrdvrbi/C9wewi4B+gGAOaA7O3iCv8A8jZdCSXI21YAAAAASUVORK5CYII=);
        }

        .icon_safari, .icon_mobile_safari {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADc0lEQVQ4y21TTUwcZQB938zs7O/s7A8LsLSUUkurIkkPVYPSAIvrJiZqNrQHDYazHIqhHIgXNRFC8GIiCcle2BNNo1IlHCQhGyobQoq/sWTXQFuLS/eH7s+wzM7PznweDNUY3+nlveTlvcMj+A/W1tZQq9VgtVpFlmVtAwMDuX/7CwsLGBkZwf8imUw+5SsrK58mk8lP9vb2QtVq9cLW1lbjiTc/P49YLAYAICdiIpFAf38/FhcXvZFI5N1UKvVhPpdtptQsq5ommYaZcjhdq5Ik3RweHs5Eo1F0d3f/HXBSa3l5+XxXV9cXGxt3wsVSFbLOwyQ8TNMEtBJovQJVra/X6/XrMzMzv0QiEZDZ2VlMTExgamqqoa+v7+b23a2QpLvh8F2k54I+oqgaJFWHpkj04M/7xJR+RzZX2OQ4bigWix08nRCPx8cPC/nPVK4JmrMLFgsHJwOYMHAsl8FBA82mIds9VCn8TCSpOikIwiwDAGNjY8F0OvWWxSbgMdroEcMipxpgvA5YRR7a4SN473yOB2wQxNVMnJ4gRNE9KgiCnQMAlmUDHEMulamA/PExqVV1EJcHKEpoO9jCyz/N417vDeiyE6WKhvZAGzWU0ilZloMMANjtdqcoul1PFAaGAhSLx3j+tB0+N4tWksPqc8PYP3sZDxgbtosmqsQOAopKpdLBAUAgEDAtLAMPIcjJDrAOAzvZMt65YMFO82WogXPIqCakJg9o3YTNaSJTKsPv9ysMAHi9XknT9Wybm6Lgt0EJCDjtBm7v5OE68yxyJQ0VhofT6cAzzSJEIhNV08AwzD0GAHZ3dzN/PNpfF9g6Ih08PCKPx4qB+56LWH2oI5tnwNussIHgpTMOWsukcFgsfZdOpyUWANbX19Wenh7p19923nj9hXZ7y6lWWnC1EJ3nUNN5+HgrGhs4hBoIbc1uk69vfyubpvn+0tLSHptIJBCPx7G5ubnX2dlZuvvDj4MdNsPy6lk/XmxvpJeCNtLbbqHn5YfkaHuVfPXNcq1YLN0IDQ4sXem9QgkATE5OYnp6GpRSEo1GXzk6qn4kikKouakJDYEAaqqCYrGMwuHhhqIoH4dfCyXGPxg3hq5e/edMo6OjmJubAwCEw2Gb3+9vqRv1Xr1uNPK85YnP5/8+k83uXx95Tx18820MXbuGL2/dwl8jF4py9MDeJQAAAABJRU5ErkJggg==);
        }

        .icon_ios {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABDklEQVQ4y53SMShGYRTG8d8HWJSURUoZzRZlkMFgvYNys90MZoMsymZmvCy8m6vspDArZZJJfAuxKQws91Ouy70806lzzv+c93kPNZSGrCsNWW9Zrq1G8wA2cP0vANawgN0/A9KQjWAMO1guq2kUGjoxh1E84Ag3mMJsHm8lcXT5DZCGbBh7GMNvesFiEkfb0AZpyHqwUqMZmrgqejCEScB7xfTNJI7OioBu9JX5UtAzTst+oVHRCNCBwTLAW06vUi/mywD3uKjhAURpyFbTkLV/ApI4esRhDQ9a8An0Fy9xH+cVWzTy3EESR/dfAEkc3WEZrxVbnCH4ad00ZNNYxzFOcItxzOAJS0kcNQE+AK/7SEgBlbhOAAAAAElFTkSuQmCC);
        }

        .icon_ie {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADaElEQVQ4y42Ta0yTdxTGn3/79oottyJiCwUGrhC6mXSqhBjUDBejGqMRISNGgibTD9NhsuyCH7bEbMNMt29zRl0MWdxFIU7UJWNbZGMXHUKJCVJqLFBapO3be1/7Xs4+OJuxTzvfnpxzfjnPSR6G/1GeXztQ29SHwOh+Bzfzy5FERAoLCSGR4SNe7r/DzFgISvPPZOPmna9aB34zKdGbdW+aAleG1LtSrz9rDvdo9ywF5BWCUjwrq3Ge3dex/9CO3a1Ynf8n8mbP4EfuLF255XYanvsqnPEOn97cVAWJ5udYbtlYAKSjeVZn48yug28UVdgIB6r/ghi7g6+lT5FOp8CnMhSOJ9nVzz6/Hb93vXmox1ChzgFEAVxJ1V3Lhn32xhemWLdjlLy+Cbajr9lzzz3OPxS5Ir+mCHPQM1ZqtUe9fv2lQd/Vp771+YDWsImr30Yf9e0hfrSTfD+sI+2KFzuJnvK5LYePFp/+iYp7v6eCE9+Sdl0bAQAHACTEAJWlvbtDoVaHhZlTQ2g41QiWP+ep2N7Vsqp1GTLp5HSYjyObVaCORyFqzIBh+bbcEzu7rJUta+2sPHoLr420wB9XkfqVt4aDljJAqwG0KpAsEYXnWDY2C8rKAKNa7sTbLqgoa7KU5z+/BvfpbryInbvtALMZmT4b+k7HJzk1pyIQQXqSISGyiOzCDGR+HoAcZABw6oO1x5udJe1rMOiqvHYBvkAchlX1yHy8xQQg+c+R6uXtve/IaSHL+z2k+CdVjH8wwHUfW28XZbJWy1N1Fycb4IuWQFNaBnO9E9q9J2/Evnl3L4BEwe73zotNbW2pR4+hLAsCwV6QEP+QY8StrrTpzVLCbfzkS9t5FE91cVUbYdQQXMeOb+AOtAUzKQEJcwW804tQMSL4Jxj4R+0AoEqmqHCFWigNRYWge9xzEOOXT4qzDyGJChk0Cl5y2eFaXwsdR5CfKMg+GGO4f+0wUjOXAYCbDyRDUlKdFCWMAQDCd3qUPy5dmI3QUc103pERs40jmRANRHzCpHtQNfbF+wiPLeSyU+dYWbP95ZUNh6on+iXSNZvL6yJCyL9RxynMVjt/jm2C8O+4aBxbIU7ezGm1LMmx0YmFxRKzbqBMn96aeuw39f8cu7jzTGKkptAk9f+eXZI3JTS9RP8N6C+QWoRD36MAAAAASUVORK5CYII=);
        }

        .icon_win81 {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABx0lEQVQ4y5VRPW8TQRSc2V1fsImC7RjxWUCIEpsCiZaWFgnRUvM3EL+Ckj/BX4CGhgqCQkcUhUSxcJDj+G7vdofiLmdjOUS84nR6+2bemxliST37MDQ+RBLAzsS6Wy1rn3R5/ftJvnXoORh5PPDgoIjY5ouPw+bXMdonORu9plltW90d5epfNVprGe3vntnXhbAxLgAfCUAAWC9zRxmfj3K88eKNHxN1vgVAMmg7Hawn4d1Rxo1qVqBYglW1CPcz471jz/6cAgGgqDNDhGqu+rIG1hfg76HyTyWNiEvL8Xyp5tsV8pxBugBOuBhpZttn+gg0CNjycFN15w0sO+7RWvy82uBbSxRWiqdFnAhUr6FfYvEpW+Ekj/Iyig6iM0SDQmIsDAQ39OwfpnxpjVICghjSIA9gr3fFxqn4yhlGCGEakRYBBSBZADQG7iBFc+jRWXQ4IJpAdY8zbi7TXptoOBM9H6QBwtK3xRQ0Zwgum14ao5AAXIixTK4mFy/kdY87eJ+YoNPA+wHc8hGbecTtFapDIQGJhSMr6vLB3Wnxy9iHnf3UMo0waQAfrifu6TV/c/e3mlQ48eDAR24HoT/O0Z3q/2T+s/4AH1XSLh6pxbIAAAAASUVORK5CYII=);
        }

        .icon_android_os, .icon_android_browser, .icon_android_webview {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAABYlBMVEUAAAAZUAAAAAAAAABBdQBOjQAAAAAoXwAnQwAlPwCgz0wvdwBTkRAqcQAYUAA3dwAmXQAAAAEtbQA9fgAqZwA1cgA1cQAwbgAueAAveAA0XgBAewApawAiXABQjQ00XgBGhAAlXQBGggA2cQCi0EwqXwA7egBDfwAzcAApXwApXgA/cAAhQgBDfgA5fAAlRgAuYAA1YwArYgApYACJyQCMygA3egCIxwCOywAtYAAmVQAiVAAwYQBMjgBNjgBJgwA2YwAuaQB0rxaGxQCDwwBmpwCT0AB1ugC03WOMuVFnqABoqACg3ApysAd8vgCz2mdytwCAtDN/wAB6sSadx11trwCw3VKk2TFpqQOHxQCcxl2e1R5ztABoqgCDwQCg1x5tsABZmASjymidx1WbzTSz3lK23Wegx2mbxlGf0Decw2iWwF6BwAB9vACm2jGu3URcnAWGt0KHvSeFwwCFt0Ks20RCEqUkAAAAQnRSTlMAkBYCT0cBgwQE/kzNPpCNjgKMjIGMjIyChFSMjIG2UaWDjI7+hYYAjIWDrU8AkU+tWYOO/v6R/v6mnp6mAACOWYNhnt5NAAAAyElEQVR4XjXIU3cDAQAF4Ztl2BC1bZuL2E5tG/+/t03ynTMvA5JkONo7XJAlNHg7nffZ7FVvn4im/gd7Ljd8PQrCGHtPmMmkeXLBMQPMPro9lrY/S/7LVb7um5672C3FngKVIIfvTY1HXygaP/gJcYRf1Y/MM2W+F6tdHONnk/nCKRXyA0eDHEOpkaLxRUZxIrXHsT81rel10rW5+QUORUR6eSUSWVtPQ1Twb+PwfHOrVN5G0w4+j8Gwi5ZaolGLTRCsVkGwgX4BcMspS59dLDQAAAAASUVORK5CYII=);

        }

        .icon_linux {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAFo9M/3AAADUUlEQVR42n2QX0xbZRjGn+/7Tjmcwmk5bWHbaScHRvdHiMYVEqMbmqyVzKmbzkmmU1MvjJpo4tZpdqHLEpYYQyI3aowOiBcbCSFOL5Rp1AzJIm5TRkZSBRlQWllXgLa06zk9PZ9XGDYSf3dv3ry/PO8DAIhEIucAAOl0moMxBgCg4XD4hiRJ3QCA1lYPfu9pLQEANrlIReLSER6N/llavHYsDwAIh8MnVFWlWOXK9w+l7KJwEgCwwatRwzCszs5OSxRFQucG96yMX7+OF3bHsUPh9VhLMBhMHz0WKQJ4BgC5Y8kY25e6GTMNw7BkWV6mlFYBACsTgKZqe6D3y09/qtsWYEtLS2R7rSxOTkw+vqVO/QweJxHHvhEu6lOkePrdlvFg8LGvC5Oi+cX7Qq9og31VD0mSlK6urt80TQs0NjZiHbW12qmW5gdMh8M5szYgXe1qizeTGfp8I7wuwVlVKbJ1huPH3xkzMnFrYGDAYox1/Gcpt8sQBHZobi5WKhQKPJlMckVRLMaYlxACeu9Gnb556P63nA4HyeVyyC7fwtaGei7bbfeIZTaw0R5fx4HnDx7u7ztLfVsfseanRhA+6CBtDXlpenbhK/zwcfnhf0ZYPBO1mU/tPzDYEblvdOGabfnhJrYLd/ddU1MDADAM45VAIHC62lPtsbiFoaGLw/PzN18GMHv3c8LaIZlMAgCad27zPv1EveR2ypSWKvjlX4e3AwgBOPO/Ar+/EgAkt9vl3Lu7jqk8Bt21h373y5Q7ca7vOUFgl3K3jSgAvq5nQggBoGma1nfhwqBRMouWWdStfD5vTUxMWKFQyGSMRRlj++44pJTC7VYIJdjgUzd90t3dbeq6bhUKBZ7NZnkqleLxeJz39PZafr+/pCiuEZvN1qy4PIRSCiaVceGlXWU7T7Q/+MYHJ/e309JS5d+xDCpkN9F1HblcHoXFSfDEtzAsgmcf9eliLv3z5s3lNxqqCSeqB/J4v/yh06u+CgrOSys0ccuBWf1t5HkdZqZnUVz4EUfa/kJFlcBvZ1b42Gj26mvvJV4fmyn+QSgBFAcRGat07Kh1+NqfXAzBZjo/OuPtm04k4+BF3uQn6qmj7MUrl2ny7Plif0szSQxfLZZi8xb+BbBfT6mqnHLnAAAAAElFTkSuQmCC);
        }

        .icon_win_vista {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADpUlEQVQ4jQVAfUicdRz/fH+/514e71XPe5unuXmapFKupr0yFsQqWbkqIiqigJpF0CiAEey/ERAQwUYQgYONGjRgLzCZ0IKWwlji61Yz1d30pqeed8+9PHfP2+8XVHAE3Izo1twqc+q6Mz45k1rI5N8L+dUXQYh5PS4KN3hWHm1pHnvt+d6LyVhToVDSmaJwAQC06wjyM8LtOxl5+sL4F+VS9WS6Nd4c8KlS4YwcKaEbltzcLlKpXJ39cGjwxNFD/WPFSo04Y5I2dJtcHHLk5E+nl1eyn+9rS4iSYYBbJgzJoHBOPheTLsUN07bZ/Mp67av3X/pk5K1D5wtlnVGmYOL7s5c+O//b9TPtqajtLxfZsCixhNtBVeG44gQxr6tQXQTOmcOJ8UyhkL/43cjhg0/1TClrG7k9v169ecLj8uBudocdo012NKrBSCmI+mzktEY4TW6sTANFQ/JAhDli2xs59fO1L5/u6/iAKy39H92cW36HfKqoO4Idjy+hb0BD4ICF7WAd42Ycr79JiLRugpIaqhC0k43Rer4UfaGnbYxXm3u/zpvisXpDQLZTkd4OLmJaqHB8Oh4KDpF6DumWEOqmBltWsDCfoJ1qAoZj+dKxwKRCXHlEqgFwrqAaSODb1m/QubcD9z0V3PjjMoaGGRQlCI/qh26Uka8kwEJh6VSIbWnVmOJu8FvQ6yAYCKd6EOjaj/1pP55IJ1GuPYCZy+DCvQ2ozIaRa4LGWuFp8JJl2iDFZSjptsTi7M7as16vigj3oJjPYznM8CC7gHQwi4+H2lFYnUajcQ9nJvbh3FZcMtUmVA29LRpaYkcGu8fBFYRDEaqbFjKbD/HXah5T95fxZPJfyNzv8IpZIF/Ctc1uIBiWlktFNOz7Z6Aj/jcbHui4+nhnanIDKq14mL1FNm5tbyFj7qDFuAPK/Al16T8srqqYoV7Z2BSQlnDh5e7m0Y5kY5GEWcP4Qvbgq2fnrgSi0aAr1OBYHoV04bB2YxnP0DwcU8gps0tuKntlrU68xdi69MuR5LuxWKxOu0WNNaqKOHd7/Y2RG7kf66FwzB/xS4/fTUKQLJuSTEuAmYZ0Sjp11rcv/3DA/WlPezJXswSRpmlwpGRhDxeTq/m+UzPa8QlTPSyC/njQzbktBSqGXfOXtbuvKIXRY2nX6J7mJr1mS2IESZqmAQBsIVnAxYVj1WlyTeua2LX6dwwRl9IxWpi1NOh3pjob1YLBvWTaDjgjCQD/A420xEeCXGQ/AAAAAElFTkSuQmCC);
        }

        .icon_win32 {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAFo9M/3AAAEAElEQVR42gUADUxUdfz3f1/3+eC+OI/7iLiLzelxfIowEalNudBh05pllTkpW9DWmKvccjCq3GJrzeFqptMoLIajclsIjAlDNacNME4QDA6OA7jv4969u3fv3nsNAACaiwx2ArcW5x5qIeuA+6n+a02eHHCP++ZQ036PDW+vs8Fwh0vIc2yTHfy2YgRVdIxfVESjZX+6W6sXA+geMssJePrxzqWm1bR9R0M+YEPvOn/Y+o+31Rx/jueC+DB2o3Hg/cP4ZxvKtDQyeS11FE539v/4W8fes6KnXgQAQDVWGtrKTM7Db1qmmZEg+ucZXBr9wLh569Lc4MuflNShq29UohIzffay9hR2erZL1Vuu3q2qUO/LoSixt322BdS179RcGFsTXvzmgVB7pOvCws87BfFJtZj8OyflKrYBJrvTc98/OY0Hb/eSH5Vev6k1R7ZisUy4+Zzp1WQ0geG0HAffp5WlX520j7Xk5OQIBt3dqWBMshVrQKakgGiryke0VjYhhDlVckPskDUZnE3V2JWtaFamTVnXCU4CAjeScn4mAcm4NJsk8QPljQWvZyVM+u61CTshpRPmq4EjnfNYKnqgoMdB0ESrDMOkSFSMRzYSfjz64e2uotKqtlGfvFGn8l0WcxkPLqH08kDg/JI3NU04TfTB1RiH+EhSanT+e7SoJOQmNSZ0pp/vxXEWCDq2ObMyGxpMhlA1D9R+Uq7CgF8XL94oGOD4DGDhxz0NwPHvLQ62lYsUN8Zm9dyMhxrX6/0EAABSUxi01lugGaflpt2541SRbJcYTwP3hIHYiijEguiXk+H1rk0pu1Z2wBzf7sqTus/cR3qrWp2NA0+4LGpQ4DiaVmWPW4ykSwJRFAIcxsVEYKMQn3RSy3udziHKQhk0RmJNTRBbnbfchjVfNjP0xdMTWHu1GcUCmcKGHdpTQPGBjJ+d5cOZFZZBQkhAU349ZRUVuEGpwSgZjhUihFwJTtq2NBof9C1uPiaO3SVA80q3nXM40i+Y9aopkqG9mVCSTW5+T+rmr1eYhr5U6TFKocKQHMeAEwDFlnnv3ENfH5Nit4g0YAXP2ws+d1gMewJMBg/EWUhHGA3JbBSfr/z1LZNachUa1/rYjN4rIIWaJue3X5vfM9ztKZsAWAVCd6L7kNNE12AgYf4IC0yMlbgIy5crPX9plahVrU3qCaXsWK48HwBWwL+iCl35fbWtYV8U5haUQOzqP/fgj75UuZBKRgUJA52h0Mpray1vNz5ykwrRpjUmAMlMCIiMJLARuPPQ1OcNZr0hhkHeVVZCAAAqmgZKRgPHC8BnUqArfAnEwBhBiAqDu8rkcNgYy71pMvxogZyPJ5+F+GwqjUCSBFGC/wGCU912z0pBvAAAAABJRU5ErkJggg==);
        }

        .icon_edge {
            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzOTggNDMyIj48cGF0aCBmaWxsPSIjMzE3N2JjIiBkPSJNMCAxOTEuNDJDMTIuNjcgOTEuNjkgODAuNjYgMS4yMiAyMDIuNi4wMmM3My42MiAxLjQwNiAxMzQuMiAzNC43NiAxNzAuMiA5OC4zNyAxOC4xMSAzMy4yIDIzLjc2IDY4LjA2IDI0Ljk2IDEwNi41djQ1LjE5aC0yNzAuNmMxLjI0IDExMS42IDE2NC4yIDEwNy44IDIzNC40IDU4LjZ2OTAuODRjLTQxLjEgMjQuNy0xMzQuMyA0Ni43LTIwNi41IDE4LjQtNjEuNS0yMy4xLTEwNS4zLTg3LjQtMTA1LTE0OS4zLTItODAuMyAzOS45LTEzMy40IDEwNS0xNjMuNi0xMy44IDE3LjEzLTI0LjMgMzYtMjkuOCA2OC42aDE1Mi44czguOTM3LTkxLjMxLTg2LjQ3LTkxLjMxYy05MCAzLjE4LTE1NC45IDU1LjUxLTE5MS42IDEwOS4xeiIvPjwvc3ZnPg==);
        }

        .icon_opera {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACRUlEQVR4nHVTQUhUURQ97783f+bbaD9Hy4SY0IwCBEUhKkBXrVKSRBUIchO1c9uuTZsgoE0YAbWppI2WtguGQdpEIGRAA1TCYKmjKGaqM/P/6b3vN51JLxz+591zzr3v3v+BsuDgoKtxkwMDY+zvT7GvL8Xe3jH29Ayzu9st54sScVdXC6QcA3l6888Gstk5gMSpkyfg2BHA91eRzw+Jqanx/wzY0WHEKZDufG4ZH798/b0ITjoQG0eB6xfPnXETRxxjAhSLQ2Jm5nlp6+3tP9jWRra2Mu1UcRjqFoCEyU3A7kxH42RjI9nQQCaTK6yr27sOm5quaQSEfDJJLSCAxv0FzBlrasjqatJ1mYvH7+4Z1NY+0yATCS5VVnEU9qfd6vsMpnMyQk9KFiyLC0IYjh0kvWgs5Ud0UikuWmrXoLLMIJWBxSzAWY3vQhBAQpnkSlHA8wooAliDBcAq31YQSxpG4GlEhQJYiAbMZfiYA/AzJB0Wqxq5kLMp1C/slsrRT2/LKBYDEiHL2g/DXQNhTLaFxDz8DIBiYDDnF8aFUFgNDaLAWQByv9oHWozBOoB65eCDt50GsL43JBmbeK8cjgAcheIL2P/WpAc4/BKKjwC+lTG+ljFTvbmkvxva+I1yMlOROEeEpQ2U+R6mzfRfQfGxPkvr3DtVsXYZ6EK45pJ/4QJw/raMPWiW9lUbFhb8QnB+zNq5zWcvP3nf23r4DZjFDg4MtxO4cge491Q6TwzM+6Wdqi0axw8TlkdFSK4PnwdtBn8BOEzwZa08uPcAAAAASUVORK5CYII=);
        }

        .icon_chromium {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2MDcyRkFEMEM3RUIxMUUzQUQ1NUI5QkNEMDYyQjREQiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDoxODQzMkU0NkM3RUMxMUUzQUQ1NUI5QkNEMDYyQjREQiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjYwNzJGQUNFQzdFQjExRTNBRDU1QjlCQ0QwNjJCNERCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjYwNzJGQUNGQzdFQjExRTNBRDU1QjlCQ0QwNjJCNERCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Mb9D8wAAA1JJREFUeNpsU0tvG1UU/q5n/Brb47cdx/Y4aWKSqE4codI2j7qWEJUQWbTisWnVBTtY9MFfYAdCQiBUFbGoGrEABQQIpKhBhfJIoaqilrRpk5TUcRNcu47jxzzssWfMtVERKj2re6/O+b57vu8cgqeELxJ/NpaYPMq5ghFC73Ilv5VZXvyquLW+9GQu+e/F4QkNTr926uLw/iMTHO+B3tLoaxsGloFY2cHd3xeu/jr3wUmx9PDe/wD48DMvvHT6w0uBUBTVfAZtTQUhhi6ApukAY4TNF0P+rwdY+Oj0kVpufeFfAKvTPzT15rllG+8yysUHsFjMkOpNyEqDlgO63kZb11BXVVg9EUi1SnPlwplRNGurTAfg9bcvfMxHEomVpUWYORsyuRKifjsmR/sxJPghhDxw8m7EQgEIXhNSqUNMTyjY+8cv858Tb3hw+J3v7t7J3t/EF3NfQyUMZqaGcPTwcxCbLDRdR9htgsNmQlluwW1n4fOwqDeAA3vjI+zA+HQaRgZCxA+vPwixuI2X0/txdU1ETVFojwRXZBXHDvZgT8SOYlVBdhuIhx2YTKXTrJX3CrRFqBRyJDECa82OWxtlrGZ2EfJYuhrslBX8dqeEAQqgUkEZ8o/2Lm9QYHVd0zXqlliT0BvyY+9YAMurRWyXZHBmQzcxX6kjWDWhU2cgpKt8x+AW7Y8tF3IbnX70dhss0dFgHJhIBPHDShE/rSrdZBMLHEr0o+Nm50vEQKDQ4/ZWdoNwroBw6pNrf7rdPEvUKqRmG+MxB1qSjMs3c5SVYF/ch9RoEIqqoU2JbDyP3E65NXNgeMAglwvZG5fnZjmfG5JCfWYJljI1iMSMY4fjmEhGwTm4bjGh9K2WDhcPfPnZp7PlR/lsVw3CGP1vnL92a3BsPLC7uQazxQgdBshNHZLcxCv7fIh6zdSBJnr3uHBlcb1wIpVMtDXlUXeQ6JjJKz9/M98zMn08Opq0NOqUqSGjKqoYj9owJjghGqxwhq2Y/36tcvbV59N1sZTplDKPd6FZFws3L82er+yKIbu/L2l0xeAPBnEw6YREWNy4/RDn3n3/4ntvHX+xXitln7qNj4M1c4Ge4akZoa+vvzOB2c3M/fXrP37bakiFJ3P/FmAARK9aijtRw5IAAAAASUVORK5CYII=);

        }

        
        .mdl dd {
            margin-left: 220px;
        }

        .mdl dt {
            width: 200px;
        }
        .mdlLink { border-bottom: 1px dotted #ccc; text-decoration: none; }
        .newV {
            background-color: rgba(255, 203, 1, 0.7);
            border-radius: 4px;
            color: #980000;
            font-size: 12px;
            line-height: normal;
            padding: 1px 4px;
            font-weight: 500;
        }
        .pvT {
            font-size: 15px;
        }
        .pvV {
            font-size: 18px;
        }
        .pvTV {
            font-size: 26px;
            font-weight: 200;
            font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
            line-height: 30px;
            margin-top: 8px;
        }
        .pvChange {
            font-size: 13px;
            font-weight: 500;
        }

        .pvDown {
            color: #DC0001;
        }
        .pvUp {
            color: #2A8215;
        }
        .pvDev {
            font-size: 13px;
            font-weight: 500;
        }

        .dotted {
            border-bottom: 1px dotted;
        }

        .pvSpan {
            float: left; padding-right: 30px;
        }

        .pvTable td {
            border: 0px !important;
        }
        .pvTT {
            color: #ccc;
        }

        .popover {
            max-width: 600px !important;
        }
        .stngs:before {
            content: "" !important;
        }


    </style>
    <title>Visitor Traffic for Clustrmaps.com</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="/assets/clustrmaps/jvectormap/jquery-jvectormap-2.0.3.min.js"></script>
    <script src="/assets/clustrmaps/jvectormap/jquery-jvectormap-world-mill.js"></script>
    <script src="/assets/clustrmaps/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
    <script src="/assets/js/timeago.js"></script>
    <script src="/assets/clustrmaps/jquery.sparkline.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <script src="https://cdn.jsdelivr.net/odometer/0.4.7/odometer.min.js"></script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>

	.home-intro {
		background-color: #f1f3f6;
		padding-top: 30px;
		padding-bottom: 60px;
	}

	.hh1 {
		font-size: 35px;
		font-weight: 400;
		font-family: "Helvetica Neue", Arial;
		margin-top: 10px;
	}

	.feature {
		text-align: center;
		margin-bottom: 30px;
	}

	.feature i {
		font-size: 100px;
		color: #16a085;
		text-align: center;
	}

	.feature p {
		font-size: 14px;
	}

	.feature h4 {
		font-size: 16px;
		font-weight: 700;
		font-family: sans-serif;
	}

	.mlist li {
		font-size: 20px;
	}

	.ftbg {
		font-size: 24px;
	}

	.ftbg2 {
		font-size: 20px;
	}


	/* NAVBAR SEARCH */
	.nbr li a {
		padding-top: 6px !important;
		padding-right: 15px !important;
		padding-bottom: 6px !important;
	}

	.nbr li.active, .nbr li:hover {
		border-bottom: 3px solid black;
	}

	.nbr li.active {
		border-bottom: 3px solid black;
		background-color: #eee;
	}

	.nbr li.active a {

		background-color: #eee !important;
	}

	.nav-tabs > li > a {

		margin-right: 0px !important;
		border: 0px !important;
		text-transform: uppercase;
		font-size: 11px;
		font-weight: 500;
	}

	.nav > li > a:hover, .nav > li > a:focus, .nav > li.active > a:hover, .nav > li.active > a:focus {
		text-decoration: none;
		background-color: #eee;
	}

	.nbr li.active a, .nbr li.active a:hover, .nbr li.active a:focus {
		background-color: #eee !important;
	}
	.nav-tabs {
		border-bottom: 0px !important;
	}
	.twitter-typeahead {
		display: block !important;
	}

	/* SUGGEST MENU */
	.tt-dataset {
		background: white;
		padding: 5px 55px 5px 20px;
		border: 1px solid #e8e8e8;
		margin-top: 2px;
		border-radius: 3px;
	}
	.tt-open {
		width: 384px !important;
		background-color: white;
	}
	.tt-dataset{
		padding: 5px 0px 0px 0px !important;
	}

	.tt-suggestion {
		line-height: 28px;
	}

	.tt-suggestion.tt-selectable:focus, .tt-suggestion.tt-selectable:hover {
		background: #eee;
	}

	.tt-suggestion.tt-selectable {
		cursor: pointer !important;
		border-bottom: 1px solid #eee!important;
		padding-left: 10px!important;
	}

	.tt-menu.tt-open {
		top: 31px !important;
	}
	.tt-suggestion.tt-selectable{
		cursor: pointer !important;
		text-align: left;
	}

	.tt-cursor {
		background-color: #eee;
	}

	.bvItem {
		font-size: 17px;
		margin: 15px 0px 10px 10px;
	}

	.bvLink, .bvLink:hover, .bvLink:focus {
		color: #337ab7;
	}
	.bvB {
		background-color: #ff7373;
		color: white;
		padding: 3px 8px;
		font-size: 12px;
		font-weight: 900;
		border-radius: 16px;
		margin-left: 6px;
	}

	.navbar-default .navbar-nav>li>a {
		color: #000 !important;
	}
</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-1PZ787KJQR"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-1PZ787KJQR');
</script><body>
<nav class="navbar navbar-default navclstr hidden-xs hidden-sm" style="margin-bottom: 60px; position: relative; z-index: 12; min-height: 85px; padding-top: 8px;">
    <div class="container">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" style="-webkit-perspective: 1000;-webkit-backface-visibility: hidden;">
				<li><a href="/" style="padding: 8px 23px 0px 0px;"><img alt="ClustrMaps" src="/assets/gl.svg" width="50" height="50"></a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right clstrnav">
                                <li><a href="/add" style="border-radius: 10px; padding-top: 12px!important; padding-right: 25px; padding-left: 25px; margin-top: 17px !important; line-height: 14px; background-color: #3173E9; color: white !important;font-weight: 600;" onclick="ga('send', 'event', 'ADDSITE', 'homepage');">Create Your Widget</a></li>                                                    <li><a href="/bl/login">Log In</a></li>
                    <li><a href="/bl/login">Sign Up</a></li>
                            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="hidden-lg hidden-md" style="min-height:67px; background-color: #ffffff !important; border-bottom: 1px solid #f5f5f5; margin-bottom: 30px;">
	<ul style="margin-left: 0px; padding-left: 0px; padding-top: 10px;">
		<li style="display: inline-block; width: 50px;  margin-top: 3px; padding-left: 10px; padding-top: 9px; vertical-align: top">
			<a href="/"><img alt="ClustrMaps" src="/assets/gl.svg" width="50" height="50"></a>
		</li>
		<li style="display: inline-block; width: 250px;  margin-top: 3px;">
			<div class="row tbs" style="margin-left: 15px;">
				<ul id="myTab" class="nav nav-tabs nbr">
					<li class="active"><a href="#address">Address</a>
					<li><a href="#people">People</a>
					<li><a href="#company">Company</a>
				</ul>
			</div>
			<div class="row" style="margin-left: 15px;">
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="address">
						<form role="search" method="POST" action="/a/">
							<div class="input-group">
								<input  style="border-top-left-radius: 0px;border-bottom-left-radius: 0px;" type="text" class="form-control typeahead address" name="address" placeholder="address"
										autocomplete="off" required> <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" style="position: relative; top: 5px; display: inline-block; font-family: 'Glyphicons Halflings'; font-style: normal; font-weight: 600; line-height: 11px; font-size: 20px; color: #6b6b6b;"></span></button>
                        </span>
							</div>
							<input type="hidden" name='action' value="tools.address_search"/>
							<input type="hidden" name="place_id" value=""> <input type="hidden" name="results" value="">
						</form>

					</div>

					<div role="tabpanel" class="tab-pane" id="people">
						<form id="cse-search-box" role="search" method="POST">
							<div class="input-group">
								<input type="hidden" name='action' value="tools.person_search"/> <input name="q" type="text" class="form-control" size="27" value="" id="goocse" placeholder="enter name">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="position: relative; top: 5px; display: inline-block; font-family: 'Glyphicons Halflings'; font-style: normal; font-weight: 600; line-height: 11px; font-size: 20px; color: #6b6b6b;"></span></button>
								</span>
							</div>
							<input type="hidden" name="place_id" value=""> <input type="hidden" name="results" value="">
						</form>
					</div>

					<div role="tabpanel" class="tab-pane" id="company">
						<form id="search_company" role="search" method="POST">
							<div class="input-group">
								<input type="text" style="border-top-left-radius: 0px;border-bottom-left-radius: 0px;" value="" name="company" class="typeahead company form-control" placeholder="enter company name">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="position: relative; top: 5px; display: inline-block; font-family: 'Glyphicons Halflings'; font-style: normal; font-weight: 600; line-height: 11px; font-size: 20px; color: #6b6b6b;"></span></button>
								</span>
							</div>
							<input type="hidden" name='action' value="tools.company_search"/> <input type="hidden" name="place_id" value=""> <input type="hidden" name="results" value="">
						</form>
					</div>
				</div>
			</div>
		</li>
	</ul>
    </div>

<div class="container">
    <script type="text/javascript">

var docCookies = {
  getItem: function (sKey) {
    if (!sKey) { return null; }
    return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + encodeURIComponent(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
  },
  setItem: function (sKey, sValue, vEnd, sPath, sDomain, bSecure) {
    if (!sKey || /^(?:expires|max\-age|path|domain|secure)$/i.test(sKey)) { return false; }
    var sExpires = "";
    if (vEnd) {
      switch (vEnd.constructor) {
        case Number:
          sExpires = vEnd === Infinity ? "; expires=Fri, 31 Dec 9999 23:59:59 GMT" : "; max-age=" + vEnd;
          break;
        case String:
          sExpires = "; expires=" + vEnd;
          break;
        case Date:
          sExpires = "; expires=" + vEnd.toUTCString();
          break;
      }
    }
    document.cookie = encodeURIComponent(sKey) + "=" + encodeURIComponent(sValue) + sExpires + (sDomain ? "; domain=" + sDomain : "") + (sPath ? "; path=" + sPath : "") + (bSecure ? "; secure" : "");
    return true;
  },
  removeItem: function (sKey, sPath, sDomain) {
    if (!this.hasItem(sKey)) { return false; }
    document.cookie = encodeURIComponent(sKey) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + (sDomain ? "; domain=" + sDomain : "") + (sPath ? "; path=" + sPath : "");
    return true;
  },
  hasItem: function (sKey) {
    if (!sKey) { return false; }
    return (new RegExp("(?:^|;\\s*)" + encodeURIComponent(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=")).test(document.cookie);
  },
  keys: function () {
    var aKeys = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/);
    for (var nLen = aKeys.length, nIdx = 0; nIdx < nLen; nIdx++) { aKeys[nIdx] = decodeURIComponent(aKeys[nIdx]); }
    return aKeys;
  }
};
</script>        
    <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
                            <li class="active">
                        Analytics for Clustrmaps.com            
        </li>
        <li class="pull-right stngs">        </li>
    </ol>


    <style>
    .alert-success, .alert-danger, .alert-warning {
        background-color: transparent !important;
        border-left-width: 3px;
    }
    .alert-success {
        border-left-color: #56b354;
    }
    .alert-warning {
        border-left-color: #eacb00;
    }
    .alert-danger {
        border-left-color: #ff7474;
    }
</style>
    <div class="table-responsive">
    <table class="table pvTable" style="text-align: center">
        <tr>
            <td>
                <div class="pvT text-nowrap">Today Pageviews</div>
                <div class="pvTV today-pageviews odometer" data-value="11228">11,228</div>
                <div class="clearfix"></div>
                <span class="pvDevContainer pvDev dotted pvDown" data-toggle="popover" title="Difference" data-placement="right"></span>

            </td>
            <td style="border-right: 1px solid #ddd !important;">
                <div class="pvT">Yesterday</div>
                <div class="pvTV">18,707</div>
            </td>
            <td>
                <div class="pvT text-nowrap">Last 7 days</div>
                <div class="pvTV">124,728</div>
                <span class="text-nowrap pvTT">Jan 22nd - Jan 28th</span>
            </td>
            <td style="border-right: 1px solid #ddd !important;">
                <div class="pvT text-nowrap">Previous Period</div>
                <div class="pvTV">149,797</div>
                <span class="text-nowrap pvTT">Jan 15th - Jan 21st</span>
            </td>
            <td>
                <div class="pvT text-nowrap">Last 30 days</div>
                <div class="pvTV">1,806,877</div>
                <span class="text-nowrap pvTT">Dec 30th - Jan 28th</span>
            </td>
            <td style="border-right: 1px solid #ddd !important;">
                <div class="pvT text-nowrap">Previous Period</div>
                <div class="pvTV">4,056,747</div>
                <span class="text-nowrap pvTT">Nov 30th - Dec 29th</span>
            </td>
            <td>
                <div class="pvT text-nowrap">Total Pageviews</div>
                <div class="pvTV total-pageviews odometer" data-value="70808034">70,808,034</div>
                <div class="clearfix"></div>
                                    <span class="text-nowrap pvTT">Since Aug 30th 2015</span>
                            </td>
        </tr>
    </table>
</div>


<script>

    function num_format(val) {
        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    (function() {
        function decimalAdjust(type, value, exp) {
            // Если степень не определена, либо равна нулю...
            if (typeof exp === 'undefined' || +exp === 0) {
                return Math[type](value);
            }
            value = +value;
            exp = +exp;
            // Если значение не является числом, либо степень не является целым числом...
            if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0)) {
                return NaN;
            }
            // Сдвиг разрядов
            value = value.toString().split('e');
            value = Math[type](+(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp)));
            // Обратный сдвиг
            value = value.toString().split('e');
            return +(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp));
        }

        // Десятичное округление к ближайшему
        if (!Math.round10) {
            Math.round10 = function(value, exp) {
                return decimalAdjust('round', value, exp);
            };
        }
        // Десятичное округление вниз
        if (!Math.floor10) {
            Math.floor10 = function(value, exp) {
                return decimalAdjust('floor', value, exp);
            };
        }
        // Десятичное округление вверх
        if (!Math.ceil10) {
            Math.ceil10 = function(value, exp) {
                return decimalAdjust('ceil', value, exp);
            };
        }
    })();

    function makeLine (s, selector, text) {
        var cls = '', sign = '', diff = '', percent = '';
        var content = '';

        var y_diff = s['today']['tonow'] - s[selector]['tonow'];
        if ( y_diff ) {
            cls  = ( y_diff > 0 ) ? 'pvUp' : 'pvDown';
            sign = ( y_diff > 0 ) ?  '+' : '-';
            diff = num_format(Math.abs(y_diff) );

            if ( s[selector]['tonow'] > 0 ) {
                percent = Math.round10(y_diff * 100 / s[selector]['tonow'], -2);
                percent = '(' + sign + Math.abs(percent) + '%)';
            }

            content = '<div class="text-nowrap"><span class="pvDev ' + cls +  '">' + sign +  diff + percent + '</span> pageviews compared to the same time ' + text + '</div>';
        }

        return content;
    }

    function initPopover(s) {
        var createPopover = false;

        if ( arguments.length > 1 ) {
            createPopover = arguments[1];
        }


        var content = '', line;
        var changed = null ;


        if ( line = makeLine(s, 'yesterday', 'yesterday') ) {
            content += line;
            changed = 'yesterday';
        }

        if ( line = makeLine(s, 'week', 'last Thursday (1 week ago)') ) {
            content += line;
            if ( !changed ) {
                changed = 'week';
            }
        }


        if ( line = makeLine(s, 'month', 'previous month (December 29th)') ) {
            content += line;
            if ( !changed ) {
                changed  = 'month';
            }
        }

        updateDiffDiv(s, changed);

        if ( createPopover ) {
            $('.pvDevContainer').popover({
                trigger: "hover",
                html: true,
                container: 'body',
                content: content
            });
        } else {
            $('.pvDevContainer').data('bs.popover').options.content = content;
            if ( $('.pvDev').length > 1 ) {
                $('.pvDevContainer').popover('show');
            }
        }
    }

    function updateDiffDiv(s, selector) {

        if ( !selector ) {
            $(".pvDevContainer").hide();
            return;
        }

        var y_diff = s['today']['tonow'] - s[selector]['tonow'];
        var sign = ( y_diff > 0 ) ?  '+' : '-';
        var cls  = y_diff > 0 ? 'pvUp' : 'pvDown';
        var op  = y_diff > 0 ? 'pvDown' : 'pvUp';
        var percent = '';

        var sp = $(".pvDevContainer");

        if ( !sp.is(":visible") ) {
            sp.show();
        }

        if ( sp.hasClass(op) ) {
            sp.removeClass(op);
        }

        if ( !sp.hasClass(cls) ) {
            sp.addClass(cls);
        }

        if ( s[selector]['tonow'] > 0 ) {
            percent = Math.round10(y_diff * 100 / s[selector]['tonow'], -2);
            percent = '(' + sign + Math.abs(percent) + '%)';
        }

        sp.html ( sign + num_format(Math.abs(y_diff)) + percent );
    }

    $(function () {
        initPopover({"today":{"date":"2026-01-29","full":false,"tonow":"11228"},"yesterday":{"date":"2026-01-28","full":"18707","tonow":"11587"},"week":{"date":"2026-01-22","full":"19188","tonow":"11390"},"month":{"date":"2025-12-29","full":"128005","tonow":"84684"},"year":{"date":"2025-01-29","full":"14828","tonow":"8363"}}, true);
    })
</script>    <div class="hpanel">
    <div class="panel-heading hbuilt">
        <form class="form-inline pull-right" role="form">
            <span class="non_unique_visitor_count">
                <span class="non_unique_visitor_count-oneup"></span>
                <b class="non_unique_visitor_count-count"
                   data-count="1567884">1,567,884</b>
            </span>
            total visits for:
            <div class="form-group has-feedback hidden-xs" style="top:-4px">
                <input type="text" class="form-control btn-sm dp" id="dp1" value=""
                       style="width: 240px; font-weight: 400; font-size: 14px;">
                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
            </div>
        </form>

        Visitor Map for Clustrmaps.com    </div>
    <div class="panel-body" style="padding: 0px;">

        <div class="row" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="col-md-12 col-sm-12 col-xs-12" style="position: relative;" id="mp1">
                <div id="map" style="height: 500px">
                </div>
                <div
                    style="position: absolute; bottom: 0; left: 39%; z-index: 998;  background: rgba(255, 255, 255, 0.7);">
                    <span style="font-size: 11px; vertical-align: text-bottom; margin-right: 10px"><span
                            class="dot recent"></span> &mdash; Recent/Now <span class="dot old"></span> &mdash; within <time
                            class="timeago"
                            datetime="2026-01-01T00:00:00+00:00">01/01/2026</time></span>
                </div>
            </div>
        </div>
    </div>
            <div class="panel-footer" style="padding: 0; background-color: #fff; font-size: 14px;">
                <div class="table-responsive">
        <table class="table table-st audience" style="margin-bottom: 0px;">
            <thead>
            <tr class="active">
                <th>Recent visitors</th>
                <th>Browser</th>
                <th>OS</th>
                <th>IP</th>
            </tr>
            </thead>
            <tbody>
            
                <tr id="g4hap12t26rev4ea447orasa1d_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Houston, United States"
                                data-lat="29.7720000" data-lng="-95.3644000" data-ip="2605:ad80:80:70c5:93:8364:fbbf:3ce1" data-ipd="MjYwNTphZDgwOjgwOjcwYzU6OTM6ODM2NDpmYmJmOjNjZTE=" data-link="/d/TX/Houston"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Houston, United States</a>                                with <a role="button" data-toggle="collapse" href="#g4hap12t26rev4ea447orasa1d"
                                        aria-expanded="false" aria-controls="g4hap12t26rev4ea447orasa1d"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Houston, United States" data-lat="29.7720000" data-lng="-95.3644000" data-ip="2605:ad80:80:70c5:93:8364:fbbf:3ce1" data-ipd="MjYwNTphZDgwOjgwOjcwYzU6OTM6ODM2NDpmYmJmOjNjZTE=">2605:ad80:80:70c5:93:8364:fbbf:3ce1</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="g4hap12t26rev4ea447orasa1d">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701560'>January 29, 2026, 3:46 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bqq3                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="d4tue5a2l727sbggffcb1dh01r_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Schenectady, United States"
                                data-lat="42.8822000" data-lng="-73.9916000" data-ip="67.240.80.169" data-ipd="NjcuMjQwLjgwLjE2OQ==" data-link="/d/NY/Schenectady"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Schenectady, United States</a>                                with <a role="button" data-toggle="collapse" href="#d4tue5a2l727sbggffcb1dh01r"
                                        aria-expanded="false" aria-controls="d4tue5a2l727sbggffcb1dh01r"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_edge"
                            title="Edge 0.0"></span>Edge                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Schenectady, United States" data-lat="42.8822000" data-lng="-73.9916000" data-ip="67.240.80.169" data-ipd="NjcuMjQwLjgwLjE2OQ==">67.240.80.169</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="d4tue5a2l727sbggffcb1dh01r">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="7pcahh1p4kd6snsorqmr1nc4r5_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Appleton, United States"
                                data-lat="44.3456000" data-lng="-88.4343000" data-ip="2600:1700:6610:f000:2596:bf51:89cd:77e" data-ipd="MjYwMDoxNzAwOjY2MTA6ZjAwMDoyNTk2OmJmNTE6ODljZDo3N2U=" data-link="/d/WI/Appleton"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Appleton, United States</a>                                with <a role="button" data-toggle="collapse" href="#7pcahh1p4kd6snsorqmr1nc4r5"
                                        aria-expanded="false" aria-controls="7pcahh1p4kd6snsorqmr1nc4r5"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Appleton, United States" data-lat="44.3456000" data-lng="-88.4343000" data-ip="2600:1700:6610:f000:2596:bf51:89cd:77e" data-ipd="MjYwMDoxNzAwOjY2MTA6ZjAwMDoyNTk2OmJmNTE6ODljZDo3N2U=">2600:1700:6610:f000:2596:bf51:89cd:77e</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="7pcahh1p4kd6snsorqmr1nc4r5">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bpd1                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="ibe4tikigor68s0ut83i405lmt_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="United States"
                                data-lat="37.7510000" data-lng="-97.8220000" data-ip="2603:6011:4d27:5b5c:a42f:7ae6:fa89:d002" data-ipd="MjYwMzo2MDExOjRkMjc6NWI1YzphNDJmOjdhZTY6ZmE4OTpkMDAy" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>United States</a>                                with <a role="button" data-toggle="collapse" href="#ibe4tikigor68s0ut83i405lmt"
                                        aria-expanded="false" aria-controls="ibe4tikigor68s0ut83i405lmt"><span
                                    class="cntP">2 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="United States" data-lat="37.7510000" data-lng="-97.8220000" data-ip="2603:6011:4d27:5b5c:a42f:7ae6:fa89:d002" data-ipd="MjYwMzo2MDExOjRkMjc6NWI1YzphNDJmOjdhZTY6ZmE4OTpkMDAy">2603:6011:4d27:5b5c:a42f:7ae6:fa89:d002</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="ibe4tikigor68s0ut83i405lmt">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="vrpbohjr9bj1h3qhc6ekt93i6m_main">
                    <td class="text-nowrap">
                                                <span class="flag fi"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Espoo, Finland"
                                data-lat="60.1833000" data-lng="24.8296000" data-ip="2001:708:20:140b::1ed9" data-ipd="MjAwMTo3MDg6MjA6MTQwYjo6MWVkOQ==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Espoo, Finland</a>                                with <a role="button" data-toggle="collapse" href="#vrpbohjr9bj1h3qhc6ekt93i6m"
                                        aria-expanded="false" aria-controls="vrpbohjr9bj1h3qhc6ekt93i6m"><span
                                    class="cntP">2 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Espoo, Finland" data-lat="60.1833000" data-lng="24.8296000" data-ip="2001:708:20:140b::1ed9" data-ipd="MjAwMTo3MDg6MjA6MTQwYjo6MWVkOQ==">2001:708:20:140b::1ed9</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="vrpbohjr9bj1h3qhc6ekt93i6m">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bwzm                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bwzm                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="bqtffiktrm4bn9cc3vdet4ndgt_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="East Lansing, United States"
                                data-lat="42.7370000" data-lng="-84.4839000" data-ip="69.176.153.196" data-ipd="NjkuMTc2LjE1My4xOTY=" data-link="/d/MI/East-Lansing"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>East Lansing, United States</a>                                with <a role="button" data-toggle="collapse" href="#bqtffiktrm4bn9cc3vdet4ndgt"
                                        aria-expanded="false" aria-controls="bqtffiktrm4bn9cc3vdet4ndgt"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="East Lansing, United States" data-lat="42.7370000" data-lng="-84.4839000" data-ip="69.176.153.196" data-ipd="NjkuMTc2LjE1My4xOTY=">69.176.153.196</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="bqtffiktrm4bn9cc3vdet4ndgt">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bxw1                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="6qre91pmg888atnjpphkn70jke_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="United States"
                                data-lat="37.7510000" data-lng="-97.8220000" data-ip="153.33.190.236" data-ipd="MTUzLjMzLjE5MC4yMzY=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>United States</a>                                with <a role="button" data-toggle="collapse" href="#6qre91pmg888atnjpphkn70jke"
                                        aria-expanded="false" aria-controls="6qre91pmg888atnjpphkn70jke"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="United States" data-lat="37.7510000" data-lng="-97.8220000" data-ip="153.33.190.236" data-ipd="MTUzLjMzLjE5MC4yMzY=">153.33.190.236</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="6qre91pmg888atnjpphkn70jke">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c7my                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="85e66rh09hcbfdc57bq86p0hl1_main">
                    <td class="text-nowrap">
                                                <span class="flag gb"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Sunderland, United Kingdom"
                                data-lat="54.9001000" data-lng="-1.4211000" data-ip="94.9.237.129" data-ipd="OTQuOS4yMzcuMTI5" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Sunderland, United Kingdom</a>                                with <a role="button" data-toggle="collapse" href="#85e66rh09hcbfdc57bq86p0hl1"
                                        aria-expanded="false" aria-controls="85e66rh09hcbfdc57bq86p0hl1"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Sunderland, United Kingdom" data-lat="54.9001000" data-lng="-1.4211000" data-ip="94.9.237.129" data-ipd="OTQuOS4yMzcuMTI5">94.9.237.129</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="85e66rh09hcbfdc57bq86p0hl1">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/map/Ins.sjtu.edu.cn                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="gjq858im36rde2p87h5rlkapn2_main">
                    <td class="text-nowrap">
                                                <span class="flag in"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="India"
                                data-lat="20.0000000" data-lng="77.0000000" data-ip="2409:408a:1ebd:c8b2::fd0a:8d02" data-ipd="MjQwOTo0MDhhOjFlYmQ6YzhiMjo6ZmQwYTo4ZDAy" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>India</a>                                with <a role="button" data-toggle="collapse" href="#gjq858im36rde2p87h5rlkapn2"
                                        aria-expanded="false" aria-controls="gjq858im36rde2p87h5rlkapn2"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="India" data-lat="20.0000000" data-lng="77.0000000" data-ip="2409:408a:1ebd:c8b2::fd0a:8d02" data-ipd="MjQwOTo0MDhhOjFlYmQ6YzhiMjo6ZmQwYTo4ZDAy">2409:408a:1ebd:c8b2::fd0a:8d02</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="gjq858im36rde2p87h5rlkapn2">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/x8wq                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="alg53v4k6ugek6k9tees9var1q_main">
                    <td class="text-nowrap">
                                                <span class="flag ca"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Canada"
                                data-lat="43.6425000" data-lng="-79.3872000" data-ip="142.114.117.228" data-ipd="MTQyLjExNC4xMTcuMjI4" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Canada</a>                                with <a role="button" data-toggle="collapse" href="#alg53v4k6ugek6k9tees9var1q"
                                        aria-expanded="false" aria-controls="alg53v4k6ugek6k9tees9var1q"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Canada" data-lat="43.6425000" data-lng="-79.3872000" data-ip="142.114.117.228" data-ipd="MTQyLjExNC4xMTcuMjI4">142.114.117.228</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="alg53v4k6ugek6k9tees9var1q">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bcuf                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="7vjm8lv8qb2j1jq1c1vg645j9e_main">
                    <td class="text-nowrap">
                                                <span class="flag es"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Seville, Spain"
                                data-lat="37.3824000" data-lng="-5.9761000" data-ip="193.147.171.59" data-ipd="MTkzLjE0Ny4xNzEuNTk=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Seville, Spain</a>                                with <a role="button" data-toggle="collapse" href="#7vjm8lv8qb2j1jq1c1vg645j9e"
                                        aria-expanded="false" aria-controls="7vjm8lv8qb2j1jq1c1vg645j9e"><span
                                    class="cntP">3 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Seville, Spain" data-lat="37.3824000" data-lng="-5.9761000" data-ip="193.147.171.59" data-ipd="MTkzLjE0Ny4xNzEuNTk=">193.147.171.59</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="7vjm8lv8qb2j1jq1c1vg645j9e">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/tv4y                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/tv4y                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/profile/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="sem22mf391g6tiu2pjoc2a4uq6_main">
                    <td class="text-nowrap">
                                                <span class="flag ua"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Ukraine"
                                data-lat="50.4522000" data-lng="30.5287000" data-ip="89.209.133.77" data-ipd="ODkuMjA5LjEzMy43Nw==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Ukraine</a>                                with <a role="button" data-toggle="collapse" href="#sem22mf391g6tiu2pjoc2a4uq6"
                                        aria-expanded="false" aria-controls="sem22mf391g6tiu2pjoc2a4uq6"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Ukraine" data-lat="50.4522000" data-lng="30.5287000" data-ip="89.209.133.77" data-ipd="ODkuMjA5LjEzMy43Nw==">89.209.133.77</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="sem22mf391g6tiu2pjoc2a4uq6">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/19o3v                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="rsm153pll12pg5qj75h0v0ik77_main">
                    <td class="text-nowrap">
                                                <span class="flag de"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Bonn, Germany"
                                data-lat="50.7333000" data-lng="7.1000000" data-ip="131.220.154.185" data-ipd="MTMxLjIyMC4xNTQuMTg1" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Bonn, Germany</a>                                with <a role="button" data-toggle="collapse" href="#rsm153pll12pg5qj75h0v0ik77"
                                        aria-expanded="false" aria-controls="rsm153pll12pg5qj75h0v0ik77"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_firefox"
                            title="Firefox 0.0"></span>Firefox                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_linux"
                            title="Linux"></span>Linux                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Bonn, Germany" data-lat="50.7333000" data-lng="7.1000000" data-ip="131.220.154.185" data-ipd="MTMxLjIyMC4xNTQuMTg1">131.220.154.185</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="rsm153pll12pg5qj75h0v0ik77">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bn6o                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="rm68c3r7l0bk8bad2jnllusc5e_main">
                    <td class="text-nowrap">
                                                <span class="flag kh"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Phnom Penh, Cambodia"
                                data-lat="11.5583000" data-lng="104.9121000" data-ip="45.118.77.145" data-ipd="NDUuMTE4Ljc3LjE0NQ==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Phnom Penh, Cambodia</a>                                with <a role="button" data-toggle="collapse" href="#rm68c3r7l0bk8bad2jnllusc5e"
                                        aria-expanded="false" aria-controls="rm68c3r7l0bk8bad2jnllusc5e"><span
                                    class="cntP">2 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Phnom Penh, Cambodia" data-lat="11.5583000" data-lng="104.9121000" data-ip="45.118.77.145" data-ipd="NDUuMTE4Ljc3LjE0NQ==">45.118.77.145</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="rm68c3r7l0bk8bad2jnllusc5e">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="1ek2dtnrgkmqe9p0h6esmltii0_main">
                    <td class="text-nowrap">
                                                <span class="flag cn"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="China"
                                data-lat="35.0000000" data-lng="105.0000000" data-ip="240e:3b0:d04b:1a0c:6479:a55f:1965:85" data-ipd="MjQwZTozYjA6ZDA0YjoxYTBjOjY0Nzk6YTU1ZjoxOTY1Ojg1" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>China</a>                                with <a role="button" data-toggle="collapse" href="#1ek2dtnrgkmqe9p0h6esmltii0"
                                        aria-expanded="false" aria-controls="1ek2dtnrgkmqe9p0h6esmltii0"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="China" data-lat="35.0000000" data-lng="105.0000000" data-ip="240e:3b0:d04b:1a0c:6479:a55f:1965:85" data-ipd="MjQwZTozYjA6ZDA0YjoxYTBjOjY0Nzk6YTU1ZjoxOTY1Ojg1">240e:3b0:d04b:1a0c:6479:a55f:1965:85</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="1ek2dtnrgkmqe9p0h6esmltii0">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701500'>January 29, 2026, 3:45 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                    Page Undefined
                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="j8nvhvo1m5boai6rpnjh4eivd3_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Baltimore, United States"
                                data-lat="39.2957000" data-lng="-76.6289000" data-ip="38.27.115.1" data-ipd="MzguMjcuMTE1LjE=" data-link="/d/MD/Baltimore"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Baltimore, United States</a>                                with <a role="button" data-toggle="collapse" href="#j8nvhvo1m5boai6rpnjh4eivd3"
                                        aria-expanded="false" aria-controls="j8nvhvo1m5boai6rpnjh4eivd3"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Baltimore, United States" data-lat="39.2957000" data-lng="-76.6289000" data-ip="38.27.115.1" data-ipd="MzguMjcuMTE1LjE=">38.27.115.1</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="j8nvhvo1m5boai6rpnjh4eivd3">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="g4kuag90ifr712ng1ebq0mh1qe_main">
                    <td class="text-nowrap">
                                                <span class="flag gb"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Dorchester, United Kingdom"
                                data-lat="50.7971000" data-lng="-2.4013000" data-ip="86.139.216.80" data-ipd="ODYuMTM5LjIxNi44MA==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Dorchester, United Kingdom</a>                                with <a role="button" data-toggle="collapse" href="#g4kuag90ifr712ng1ebq0mh1qe"
                                        aria-expanded="false" aria-controls="g4kuag90ifr712ng1ebq0mh1qe"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Dorchester, United Kingdom" data-lat="50.7971000" data-lng="-2.4013000" data-ip="86.139.216.80" data-ipd="ODYuMTM5LjIxNi44MA==">86.139.216.80</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="g4kuag90ifr712ng1ebq0mh1qe">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/h5zx                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="3pvjc104074mpn8lq13bmfmf9m_main">
                    <td class="text-nowrap">
                                                <span class="flag "
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Unknown Location"
                                data-lat="-48" data-lng="28" data-ip="2a02:26f7:c9d0:4000:4800::1c" data-ipd="MmEwMjoyNmY3OmM5ZDA6NDAwMDo0ODAwOjoxYw==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Unknown Location</a>                                with <a role="button" data-toggle="collapse" href="#3pvjc104074mpn8lq13bmfmf9m"
                                        aria-expanded="false" aria-controls="3pvjc104074mpn8lq13bmfmf9m"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Unknown Location" data-lat="-48" data-lng="28" data-ip="2a02:26f7:c9d0:4000:4800::1c" data-ipd="MmEwMjoyNmY3OmM5ZDA6NDAwMDo0ODAwOjoxYw==">2a02:26f7:c9d0:4000:4800::1c</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="3pvjc104074mpn8lq13bmfmf9m">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/profile                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="r80rshv5uqnf29vi0nt6edkovb_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Austin, United States"
                                data-lat="30.4240000" data-lng="-97.7932000" data-ip="70.113.32.52" data-ipd="NzAuMTEzLjMyLjUy" data-link="/d/TX/Austin"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Austin, United States</a>                                with <a role="button" data-toggle="collapse" href="#r80rshv5uqnf29vi0nt6edkovb"
                                        aria-expanded="false" aria-controls="r80rshv5uqnf29vi0nt6edkovb"><span
                                    class="cntP">2 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Austin, United States" data-lat="30.4240000" data-lng="-97.7932000" data-ip="70.113.32.52" data-ipd="NzAuMTEzLjMyLjUy">70.113.32.52</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="r80rshv5uqnf29vi0nt6edkovb">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/191kl                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701080'>January 29, 2026, 3:38 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/191kl                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="u7b4emt7d4uhtdle751knq4ffu_main">
                    <td class="text-nowrap">
                                                <span class="flag fr"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Tours, France"
                                data-lat="47.3983000" data-lng="0.7037000" data-ip="78.123.235.199" data-ipd="NzguMTIzLjIzNS4xOTk=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Tours, France</a>                                with <a role="button" data-toggle="collapse" href="#u7b4emt7d4uhtdle751knq4ffu"
                                        aria-expanded="false" aria-controls="u7b4emt7d4uhtdle751knq4ffu"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_firefox"
                            title="Firefox 0.0"></span>Firefox                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Tours, France" data-lat="47.3983000" data-lng="0.7037000" data-ip="78.123.235.199" data-ipd="NzguMTIzLjIzNS4xOTk=">78.123.235.199</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="u7b4emt7d4uhtdle751knq4ffu">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c0e5                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="qr20eflenkt9iea87h2tkm9400_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="United States"
                                data-lat="37.7510000" data-lng="-97.8220000" data-ip="135.129.71.29" data-ipd="MTM1LjEyOS43MS4yOQ==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>United States</a>                                with <a role="button" data-toggle="collapse" href="#qr20eflenkt9iea87h2tkm9400"
                                        aria-expanded="false" aria-controls="qr20eflenkt9iea87h2tkm9400"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="United States" data-lat="37.7510000" data-lng="-97.8220000" data-ip="135.129.71.29" data-ipd="MTM1LjEyOS43MS4yOQ==">135.129.71.29</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="qr20eflenkt9iea87h2tkm9400">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="g0brguteoi1lgj74ik17smoond_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Council Bluffs, United States"
                                data-lat="41.2619000" data-lng="-95.8608000" data-ip="34.72.176.129" data-ipd="MzQuNzIuMTc2LjEyOQ==" data-link="/d/IA/Council-Bluffs"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Council Bluffs, United States</a>                                with <a role="button" data-toggle="collapse" href="#g0brguteoi1lgj74ik17smoond"
                                        aria-expanded="false" aria-controls="g0brguteoi1lgj74ik17smoond"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_linux"
                            title="Linux"></span>Linux                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Council Bluffs, United States" data-lat="41.2619000" data-lng="-95.8608000" data-ip="34.72.176.129" data-ipd="MzQuNzIuMTc2LjEyOQ==">34.72.176.129</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="g0brguteoi1lgj74ik17smoond">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c1vw                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="5hj00sl30vh4g8m3je2pojiunn_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Houghton, United States"
                                data-lat="47.1544000" data-lng="-88.6471000" data-ip="141.219.220.64" data-ipd="MTQxLjIxOS4yMjAuNjQ=" data-link="/d/MI/Houghton"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Houghton, United States</a>                                with <a role="button" data-toggle="collapse" href="#5hj00sl30vh4g8m3je2pojiunn"
                                        aria-expanded="false" aria-controls="5hj00sl30vh4g8m3je2pojiunn"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Houghton, United States" data-lat="47.1544000" data-lng="-88.6471000" data-ip="141.219.220.64" data-ipd="MTQxLjIxOS4yMjAuNjQ=">141.219.220.64</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="5hj00sl30vh4g8m3je2pojiunn">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/19rqb                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="2806thbsbbhi0ah5kllgtfnk0u_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Oakland, United States"
                                data-lat="37.8487000" data-lng="-122.2209000" data-ip="2600:1700:bd40:800:7238:3aff:864a:6ee4" data-ipd="MjYwMDoxNzAwOmJkNDA6ODAwOjcyMzg6M2FmZjo4NjRhOjZlZTQ=" data-link="/d/CA/Oakland"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Oakland, United States</a>                                with <a role="button" data-toggle="collapse" href="#2806thbsbbhi0ah5kllgtfnk0u"
                                        aria-expanded="false" aria-controls="2806thbsbbhi0ah5kllgtfnk0u"><span
                                    class="cntP">4 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Oakland, United States" data-lat="37.8487000" data-lng="-122.2209000" data-ip="2600:1700:bd40:800:7238:3aff:864a:6ee4" data-ipd="MjYwMDoxNzAwOmJkNDA6ODAwOjcyMzg6M2FmZjo4NjRhOjZlZTQ=">2600:1700:bd40:800:7238:3aff:864a:6ee4</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="2806thbsbbhi0ah5kllgtfnk0u">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701260'>January 29, 2026, 3:41 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701020'>January 29, 2026, 3:37 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="oovqp6ehqavg67gk19thv8f21a_main">
                    <td class="text-nowrap">
                                                <span class="flag pk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Pakistan"
                                data-lat="30.0000000" data-lng="70.0000000" data-ip="2400:adc7:210c:d200:4d3a:cbee:e25e:7d55" data-ipd="MjQwMDphZGM3OjIxMGM6ZDIwMDo0ZDNhOmNiZWU6ZTI1ZTo3ZDU1" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Pakistan</a>                                with <a role="button" data-toggle="collapse" href="#oovqp6ehqavg67gk19thv8f21a"
                                        aria-expanded="false" aria-controls="oovqp6ehqavg67gk19thv8f21a"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Pakistan" data-lat="30.0000000" data-lng="70.0000000" data-ip="2400:adc7:210c:d200:4d3a:cbee:e25e:7d55" data-ipd="MjQwMDphZGM3OjIxMGM6ZDIwMDo0ZDNhOmNiZWU6ZTI1ZTo3ZDU1">2400:adc7:210c:d200:4d3a:cbee:e25e:7d55</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="oovqp6ehqavg67gk19thv8f21a">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1brd8                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="ovmtm8bakr77hpichp53tqbcjt_main">
                    <td class="text-nowrap">
                                                <span class="flag pk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Pakistan"
                                data-lat="30.0000000" data-lng="70.0000000" data-ip="203.101.185.126" data-ipd="MjAzLjEwMS4xODUuMTI2" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Pakistan</a>                                with <a role="button" data-toggle="collapse" href="#ovmtm8bakr77hpichp53tqbcjt"
                                        aria-expanded="false" aria-controls="ovmtm8bakr77hpichp53tqbcjt"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Pakistan" data-lat="30.0000000" data-lng="70.0000000" data-ip="203.101.185.126" data-ipd="MjAzLjEwMS4xODUuMTI2">203.101.185.126</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="ovmtm8bakr77hpichp53tqbcjt">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="36m4il7lfvqpui1gbi8mm7uqap_main">
                    <td class="text-nowrap">
                                                <span class="flag kr"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Republic of Korea"
                                data-lat="37.0000000" data-lng="127.5000000" data-ip="2001:2d8:f22e:691f::116b:7074" data-ipd="MjAwMToyZDg6ZjIyZTo2OTFmOjoxMTZiOjcwNzQ=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Republic of Korea</a>                                with <a role="button" data-toggle="collapse" href="#36m4il7lfvqpui1gbi8mm7uqap"
                                        aria-expanded="false" aria-controls="36m4il7lfvqpui1gbi8mm7uqap"><span
                                    class="cntP">3 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Republic of Korea" data-lat="37.0000000" data-lng="127.5000000" data-ip="2001:2d8:f22e:691f::116b:7074" data-ipd="MjAwMToyZDg6ZjIyZTo2OTFmOjoxMTZiOjcwNzQ=">2001:2d8:f22e:691f::116b:7074</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="36m4il7lfvqpui1gbi8mm7uqap">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c8nw                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c8nw                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701080'>January 29, 2026, 3:38 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c8nw                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="it1eoed9tj48ubd672dpvc8vth_main">
                    <td class="text-nowrap">
                                                <span class="flag cn"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="China"
                                data-lat="35.0000000" data-lng="105.0000000" data-ip="240e:b87:41f:c500:f0c7:e64e:8c7:704a" data-ipd="MjQwZTpiODc6NDFmOmM1MDA6ZjBjNzplNjRlOjhjNzo3MDRh" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>China</a>                                with <a role="button" data-toggle="collapse" href="#it1eoed9tj48ubd672dpvc8vth"
                                        aria-expanded="false" aria-controls="it1eoed9tj48ubd672dpvc8vth"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="China" data-lat="35.0000000" data-lng="105.0000000" data-ip="240e:b87:41f:c500:f0c7:e64e:8c7:704a" data-ipd="MjQwZTpiODc6NDFmOmM1MDA6ZjBjNzplNjRlOjhjNzo3MDRh">240e:b87:41f:c500:f0c7:e64e:8c7:704a</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="it1eoed9tj48ubd672dpvc8vth">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1afir                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="i1ofo0988cl7bokock78eq6aa6_main">
                    <td class="text-nowrap">
                                                <span class="flag co"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Colombia"
                                data-lat="4.5981000" data-lng="-74.0799000" data-ip="186.169.245.210" data-ipd="MTg2LjE2OS4yNDUuMjEw" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Colombia</a>                                with <a role="button" data-toggle="collapse" href="#i1ofo0988cl7bokock78eq6aa6"
                                        aria-expanded="false" aria-controls="i1ofo0988cl7bokock78eq6aa6"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Colombia" data-lat="4.5981000" data-lng="-74.0799000" data-ip="186.169.245.210" data-ipd="MTg2LjE2OS4yNDUuMjEw">186.169.245.210</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="i1ofo0988cl7bokock78eq6aa6">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701440'>January 29, 2026, 3:44 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1byrb                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="7ulq33kbhmoi6ehkfhjfr53rd0_main">
                    <td class="text-nowrap">
                                                <span class="flag de"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Wuppertal, Germany"
                                data-lat="51.2446000" data-lng="7.1655000" data-ip="62.143.157.171" data-ipd="NjIuMTQzLjE1Ny4xNzE=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Wuppertal, Germany</a>                                with <a role="button" data-toggle="collapse" href="#7ulq33kbhmoi6ehkfhjfr53rd0"
                                        aria-expanded="false" aria-controls="7ulq33kbhmoi6ehkfhjfr53rd0"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_linux"
                            title="Linux"></span>Linux                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Wuppertal, Germany" data-lat="51.2446000" data-lng="7.1655000" data-ip="62.143.157.171" data-ipd="NjIuMTQzLjE1Ny4xNzE=">62.143.157.171</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="7ulq33kbhmoi6ehkfhjfr53rd0">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c2bs                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="8lf8af91tverl3tca1gumjimdf_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Shoreham, United States"
                                data-lat="40.9573000" data-lng="-72.9076000" data-ip="68.195.36.201" data-ipd="NjguMTk1LjM2LjIwMQ==" data-link="/d/NY/Shoreham"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Shoreham, United States</a>                                with <a role="button" data-toggle="collapse" href="#8lf8af91tverl3tca1gumjimdf"
                                        aria-expanded="false" aria-controls="8lf8af91tverl3tca1gumjimdf"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Shoreham, United States" data-lat="40.9573000" data-lng="-72.9076000" data-ip="68.195.36.201" data-ipd="NjguMTk1LjM2LjIwMQ==">68.195.36.201</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="8lf8af91tverl3tca1gumjimdf">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="npt13fcvfdqbql8rrrvkldgr65_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="United States"
                                data-lat="37.7510000" data-lng="-97.8220000" data-ip="205.198.68.123" data-ipd="MjA1LjE5OC42OC4xMjM=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>United States</a>                                with <a role="button" data-toggle="collapse" href="#npt13fcvfdqbql8rrrvkldgr65"
                                        aria-expanded="false" aria-controls="npt13fcvfdqbql8rrrvkldgr65"><span
                                    class="cntP">2 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_edge"
                            title="Edge 0.0"></span>Edge                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="United States" data-lat="37.7510000" data-lng="-97.8220000" data-ip="205.198.68.123" data-ipd="MjA1LjE5OC42OC4xMjM=">205.198.68.123</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="npt13fcvfdqbql8rrrvkldgr65">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c3oa                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769700960'>January 29, 2026, 3:36 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c3oa                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="tdqf8cfnip45pnjvb3vcev2lsm_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="United States"
                                data-lat="-48" data-lng="28" data-ip="23.165.184.163" data-ipd="MjMuMTY1LjE4NC4xNjM=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>United States</a>                                with <a role="button" data-toggle="collapse" href="#tdqf8cfnip45pnjvb3vcev2lsm"
                                        aria-expanded="false" aria-controls="tdqf8cfnip45pnjvb3vcev2lsm"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="United States" data-lat="-48" data-lng="28" data-ip="23.165.184.163" data-ipd="MjMuMTY1LjE4NC4xNjM=">23.165.184.163</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="tdqf8cfnip45pnjvb3vcev2lsm">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c5co                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="bmeb3poumjmutjkk8k79ks2k88_main">
                    <td class="text-nowrap">
                                                <span class="flag es"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Spain"
                                data-lat="40.0000000" data-lng="-4.0000000" data-ip="2a0c:5a87:8c03:4900:fcec:8f6:2de1:f4b5" data-ipd="MmEwYzo1YTg3OjhjMDM6NDkwMDpmY2VjOjhmNjoyZGUxOmY0YjU=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Spain</a>                                with <a role="button" data-toggle="collapse" href="#bmeb3poumjmutjkk8k79ks2k88"
                                        aria-expanded="false" aria-controls="bmeb3poumjmutjkk8k79ks2k88"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Spain" data-lat="40.0000000" data-lng="-4.0000000" data-ip="2a0c:5a87:8c03:4900:fcec:8f6:2de1:f4b5" data-ipd="MmEwYzo1YTg3OjhjMDM6NDkwMDpmY2VjOjhmNjoyZGUxOmY0YjU=">2a0c:5a87:8c03:4900:fcec:8f6:2de1:f4b5</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="bmeb3poumjmutjkk8k79ks2k88">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c323                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="htm7htduvmimkiqmp6c6afjsve_main">
                    <td class="text-nowrap">
                                                <span class="flag it"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Italy"
                                data-lat="42.8333000" data-lng="12.8333000" data-ip="95.251.164.3" data-ipd="OTUuMjUxLjE2NC4z" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Italy</a>                                with <a role="button" data-toggle="collapse" href="#htm7htduvmimkiqmp6c6afjsve"
                                        aria-expanded="false" aria-controls="htm7htduvmimkiqmp6c6afjsve"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_firefox"
                            title="Firefox 0.0"></span>Firefox                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Italy" data-lat="42.8333000" data-lng="12.8333000" data-ip="95.251.164.3" data-ipd="OTUuMjUxLjE2NC4z">95.251.164.3</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="htm7htduvmimkiqmp6c6afjsve">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/map/Enscada.com                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="7mspi7uc1e5p8pujonuk5o2cn6_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Schenectady, United States"
                                data-lat="42.8822000" data-lng="-73.9916000" data-ip="67.240.80.169" data-ipd="NjcuMjQwLjgwLjE2OQ==" data-link="/d/NY/Schenectady"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Schenectady, United States</a>                                with <a role="button" data-toggle="collapse" href="#7mspi7uc1e5p8pujonuk5o2cn6"
                                        aria-expanded="false" aria-controls="7mspi7uc1e5p8pujonuk5o2cn6"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_edge"
                            title="Edge 0.0"></span>Edge                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Schenectady, United States" data-lat="42.8822000" data-lng="-73.9916000" data-ip="67.240.80.169" data-ipd="NjcuMjQwLjgwLjE2OQ==">67.240.80.169</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="7mspi7uc1e5p8pujonuk5o2cn6">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="8mgnrlmod4b4j7i4f292qpn7it_main">
                    <td class="text-nowrap">
                                                <span class="flag fr"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Dammarie-les-Lys, France"
                                data-lat="48.5167000" data-lng="2.6500000" data-ip="2a02:8428:5be:c101:f095:37a:f5:11fd" data-ipd="MmEwMjo4NDI4OjViZTpjMTAxOmYwOTU6MzdhOmY1OjExZmQ=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Dammarie-les-Lys, France</a>                                with <a role="button" data-toggle="collapse" href="#8mgnrlmod4b4j7i4f292qpn7it"
                                        aria-expanded="false" aria-controls="8mgnrlmod4b4j7i4f292qpn7it"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Dammarie-les-Lys, France" data-lat="48.5167000" data-lng="2.6500000" data-ip="2a02:8428:5be:c101:f095:37a:f5:11fd" data-ipd="MmEwMjo4NDI4OjViZTpjMTAxOmYwOTU6MzdhOmY1OjExZmQ=">2a02:8428:5be:c101:f095:37a:f5:11fd</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="8mgnrlmod4b4j7i4f292qpn7it">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1bysu                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="4kvvshjs6ijb5c5qantb2pe0h1_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Atlanta, United States"
                                data-lat="33.7485000" data-lng="-84.3871000" data-ip="2a02:6ea0:c122:1::e031" data-ipd="MmEwMjo2ZWEwOmMxMjI6MTo6ZTAzMQ==" data-link="/d/GA/Atlanta"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Atlanta, United States</a>                                with <a role="button" data-toggle="collapse" href="#4kvvshjs6ijb5c5qantb2pe0h1"
                                        aria-expanded="false" aria-controls="4kvvshjs6ijb5c5qantb2pe0h1"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_safari"
                            title="Safari 0.0"></span>Safari                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_ios"
                            title="iOS"></span>iOS                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Atlanta, United States" data-lat="33.7485000" data-lng="-84.3871000" data-ip="2a02:6ea0:c122:1::e031" data-ipd="MmEwMjo2ZWEwOmMxMjI6MTo6ZTAzMQ==">2a02:6ea0:c122:1::e031</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="4kvvshjs6ijb5c5qantb2pe0h1">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="0474lg0n2atco1v54gpfbro47u_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Nashville, United States"
                                data-lat="36.1723000" data-lng="-86.6608000" data-ip="96.77.5.126" data-ipd="OTYuNzcuNS4xMjY=" data-link="/d/TN/Nashville"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Nashville, United States</a>                                with <a role="button" data-toggle="collapse" href="#0474lg0n2atco1v54gpfbro47u"
                                        aria-expanded="false" aria-controls="0474lg0n2atco1v54gpfbro47u"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_firefox"
                            title="Firefox 0.0"></span>Firefox                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Nashville, United States" data-lat="36.1723000" data-lng="-86.6608000" data-ip="96.77.5.126" data-ipd="OTYuNzcuNS4xMjY=">96.77.5.126</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="0474lg0n2atco1v54gpfbro47u">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="s57tm29s0o7i93r72qcaadrmhk_main">
                    <td class="text-nowrap">
                                                <span class="flag hk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Hong Kong"
                                data-lat="22.2500000" data-lng="114.1667000" data-ip="103.151.172.46" data-ipd="MTAzLjE1MS4xNzIuNDY=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Hong Kong</a>                                with <a role="button" data-toggle="collapse" href="#s57tm29s0o7i93r72qcaadrmhk"
                                        aria-expanded="false" aria-controls="s57tm29s0o7i93r72qcaadrmhk"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Hong Kong" data-lat="22.2500000" data-lng="114.1667000" data-ip="103.151.172.46" data-ipd="MTAzLjE1MS4xNzIuNDY=">103.151.172.46</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="s57tm29s0o7i93r72qcaadrmhk">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1by3i                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="f0nodco05mut3fs3tupbcc4d6u_main">
                    <td class="text-nowrap">
                                                <span class="flag hu"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Hungary"
                                data-lat="47.0000000" data-lng="20.0000000" data-ip="2001:4c4d:20c7:2d00:284b:413d:35e4:8180" data-ipd="MjAwMTo0YzRkOjIwYzc6MmQwMDoyODRiOjQxM2Q6MzVlNDo4MTgw" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Hungary</a>                                with <a role="button" data-toggle="collapse" href="#f0nodco05mut3fs3tupbcc4d6u"
                                        aria-expanded="false" aria-controls="f0nodco05mut3fs3tupbcc4d6u"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Hungary" data-lat="47.0000000" data-lng="20.0000000" data-ip="2001:4c4d:20c7:2d00:284b:413d:35e4:8180" data-ipd="MjAwMTo0YzRkOjIwYzc6MmQwMDoyODRiOjQxM2Q6MzVlNDo4MTgw">2001:4c4d:20c7:2d00:284b:413d:35e4:8180</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="f0nodco05mut3fs3tupbcc4d6u">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/18tgd                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="da3rl73pvoivm8r7me5lphbd99_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Strongsville, United States"
                                data-lat="41.3145000" data-lng="-81.8357000" data-ip="208.108.121.31" data-ipd="MjA4LjEwOC4xMjEuMzE=" data-link="/d/OH/Strongsville"><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Strongsville, United States</a>                                with <a role="button" data-toggle="collapse" href="#da3rl73pvoivm8r7me5lphbd99"
                                        aria-expanded="false" aria-controls="da3rl73pvoivm8r7me5lphbd99"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap">                    </td>
                    <td class="text-nowrap">                    </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Strongsville, United States" data-lat="41.3145000" data-lng="-81.8357000" data-ip="208.108.121.31" data-ipd="MjA4LjEwOC4xMjEuMzE=">208.108.121.31</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="da3rl73pvoivm8r7me5lphbd99">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1amvd                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="c7peh8id4vfjm0imghasiq36fs_main">
                    <td class="text-nowrap">
                                                <span class="flag mx"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Mexico City, Mexico"
                                data-lat="19.4342000" data-lng="-99.1386000" data-ip="187.190.192.184" data-ipd="MTg3LjE5MC4xOTIuMTg0" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Mexico City, Mexico</a>                                with <a role="button" data-toggle="collapse" href="#c7peh8id4vfjm0imghasiq36fs"
                                        aria-expanded="false" aria-controls="c7peh8id4vfjm0imghasiq36fs"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Mexico City, Mexico" data-lat="19.4342000" data-lng="-99.1386000" data-ip="187.190.192.184" data-ipd="MTg3LjE5MC4xOTIuMTg0">187.190.192.184</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="c7peh8id4vfjm0imghasiq36fs">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701380'>January 29, 2026, 3:43 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/t86x                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="20pp37m65auniqi3d89c48k689_main">
                    <td class="text-nowrap">
                                                <span class="flag sg"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Singapore, Singapore"
                                data-lat="1.2931000" data-lng="103.8558000" data-ip="103.252.200.211" data-ipd="MTAzLjI1Mi4yMDAuMjEx" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Singapore, Singapore</a>                                with <a role="button" data-toggle="collapse" href="#20pp37m65auniqi3d89c48k689"
                                        aria-expanded="false" aria-controls="20pp37m65auniqi3d89c48k689"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Singapore, Singapore" data-lat="1.2931000" data-lng="103.8558000" data-ip="103.252.200.211" data-ipd="MTAzLjI1Mi4yMDAuMjEx">103.252.200.211</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="20pp37m65auniqi3d89c48k689">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1c49m                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="iq2pdo8bmqc091kuukht9u9eue_main">
                    <td class="text-nowrap">
                                                <span class="flag pk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Karachi, Pakistan"
                                data-lat="24.9056000" data-lng="67.0822000" data-ip="101.53.255.24" data-ipd="MTAxLjUzLjI1NS4yNA==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Karachi, Pakistan</a>                                with <a role="button" data-toggle="collapse" href="#iq2pdo8bmqc091kuukht9u9eue"
                                        aria-expanded="false" aria-controls="iq2pdo8bmqc091kuukht9u9eue"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Karachi, Pakistan" data-lat="24.9056000" data-lng="67.0822000" data-ip="101.53.255.24" data-ipd="MTAxLjUzLjI1NS4yNA==">101.53.255.24</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="iq2pdo8bmqc091kuukht9u9eue">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="343o950bpn321pl25vvjjklqai_main">
                    <td class="text-nowrap">
                                                <span class="flag pk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Pakistan"
                                data-lat="30.0000000" data-lng="70.0000000" data-ip="2400:adc7:92a:5300:3115:5a56:6036:d762" data-ipd="MjQwMDphZGM3OjkyYTo1MzAwOjMxMTU6NWE1Njo2MDM2OmQ3NjI=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Pakistan</a>                                with <a role="button" data-toggle="collapse" href="#343o950bpn321pl25vvjjklqai"
                                        aria-expanded="false" aria-controls="343o950bpn321pl25vvjjklqai"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Pakistan" data-lat="30.0000000" data-lng="70.0000000" data-ip="2400:adc7:92a:5300:3115:5a56:6036:d762" data-ipd="MjQwMDphZGM3OjkyYTo1MzAwOjMxMTU6NWE1Njo2MDM2OmQ3NjI=">2400:adc7:92a:5300:3115:5a56:6036:d762</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="343o950bpn321pl25vvjjklqai">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="d8m6j6t9e6bj3432is3t4nna6a_main">
                    <td class="text-nowrap">
                                                <span class="flag pk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Karachi, Pakistan"
                                data-lat="24.9056000" data-lng="67.0822000" data-ip="103.131.8.26" data-ipd="MTAzLjEzMS44LjI2" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Karachi, Pakistan</a>                                with <a role="button" data-toggle="collapse" href="#d8m6j6t9e6bj3432is3t4nna6a"
                                        aria-expanded="false" aria-controls="d8m6j6t9e6bj3432is3t4nna6a"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Karachi, Pakistan" data-lat="24.9056000" data-lng="67.0822000" data-ip="103.131.8.26" data-ipd="MTAzLjEzMS44LjI2">103.131.8.26</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="d8m6j6t9e6bj3432is3t4nna6a">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="7ls1qfo0nfkgomeeteki8s773m_main">
                    <td class="text-nowrap">
                                                <span class="flag us"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="United States"
                                data-lat="37.7510000" data-lng="-97.8220000" data-ip="2001:67c:2628:647:32:504::b6" data-ipd="MjAwMTo2N2M6MjYyODo2NDc6MzI6NTA0OjpiNg==" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>United States</a>                                with <a role="button" data-toggle="collapse" href="#7ls1qfo0nfkgomeeteki8s773m"
                                        aria-expanded="false" aria-controls="7ls1qfo0nfkgomeeteki8s773m"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_win10"
                            title="Windows 10"></span>Win10                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="United States" data-lat="37.7510000" data-lng="-97.8220000" data-ip="2001:67c:2628:647:32:504::b6" data-ipd="MjAwMTo2N2M6MjYyODo2NDc6MzI6NTA0OjpiNg==">2001:67c:2628:647:32:504::b6</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="7ls1qfo0nfkgomeeteki8s773m">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="258fnhgd7d7mlt54a008tvkhbu_main">
                    <td class="text-nowrap">
                                                <span class="flag hk"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor">                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Central, Hong Kong"
                                data-lat="22.2795000" data-lng="114.1460000" data-ip="218.252.170.106" data-ipd="MjE4LjI1Mi4xNzAuMTA2" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Central, Hong Kong</a>                                with <a role="button" data-toggle="collapse" href="#258fnhgd7d7mlt54a008tvkhbu"
                                        aria-expanded="false" aria-controls="258fnhgd7d7mlt54a008tvkhbu"><span
                                    class="cntP">2 pageviews</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_osx"
                            title="Mac OS X"></span>MacOSX                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Central, Hong Kong" data-lat="22.2795000" data-lng="114.1460000" data-ip="218.252.170.106" data-ipd="MjE4LjI1Mi4xNzAuMTA2">218.252.170.106</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="258fnhgd7d7mlt54a008tvkhbu">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/site/1by2k                                                                                                                                            </td>
                                        
                                    </tr>
                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/profile                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            
                <tr id="d292gg200bm7qi7rh8go5k15pr_main">
                    <td class="text-nowrap">
                                                <span class="flag sg"
                              style="margin-right: 10px; float: left"></span>
                        <span class="vstor"><span class='newV'>New</span>                            Visitor from                              <a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal"
                                data-target="#geopos" data-location="Singapore, Singapore"
                                data-lat="1.2931000" data-lng="103.8558000" data-ip="137.132.26.136" data-ipd="MTM3LjEzMi4yNi4xMzY=" data-link=""><span
                                    class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Singapore, Singapore</a>                                with <a role="button" data-toggle="collapse" href="#d292gg200bm7qi7rh8go5k15pr"
                                        aria-expanded="false" aria-controls="d292gg200bm7qi7rh8go5k15pr"><span
                                    class="cntP">1 pageview</span></a></span>
                    </td>
                    <td class="text-nowrap"><span
                            class="icon_os icon_chrome"
                            title="Chrome 0.0"></span>Chrome                                            </td>
                    <td class="text-nowrap">                        <span
                            class="icon_os icon_android_os"
                            title="Android"></span>Android                                            </td>
                    <td class="text-nowrap">
                                                                                    <a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Visitor's IP" data-toggle="modal" data-target="#geopos" data-location="Singapore, Singapore" data-lat="1.2931000" data-lng="103.8558000" data-ip="137.132.26.136" data-ipd="MTM3LjEzMi4yNi4xMzY=">137.132.26.136</a>
                                                    <br/></td>
                </tr>

                <tr class="collapse" id="d292gg200bm7qi7rh8go5k15pr">
                    <td colspan="4" style="border-top: 0px;">
                        <div style="margin-left: 30px;">
                            <table>
                                <thead>
                                <tr>
                                    <th>Time</th>
                                                                    <th>Page Visited</th>
                                
                                </tr>
                                </thead>
                                <tbody>


                                                                    <tr>

                                        <td><span class="text-nowrap"
                                                  style="margin-right: 20px;">Visited on  <span class='local-time' data-time='1769701320'>January 29, 2026, 3:42 pm</span></span>
                                        </td>
                                                                                    <td>
                                                                                                https://clustrmaps.com/profile                                                                                                                                            </td>
                                        
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                        </tbody>
            
                        <tfoot>
            <tr>
                <td colspan="4"><span>Website owner? You can access all data details and configure this page if you login</span></td>
            </tr>
            </tfoot>
            
            
        </table>
    </div>




<div class="modal fade" id="geopos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Visitor's Location on the Map</h4>
            </div>
            <div class="modal-body">
                <div id="mapCanvasinModal" style="height: 400px; margin-bottom: 20px;"></div>
                <dl class="dl-horizontal mdl">
                    <dt>Location</dt>
                    <dd class="location"></dd>
                    <dt>Latitude and Longitude</dt>
                    <dd id="geocoords"></dd>
                    <dt>IP</dt>
                    <dd class="ip"></dd>
                    <dt>Autonomous System (AS)</dt>
                    <dd class="org"></dd>
                    <dt>ISP</dt>
                    <dd class="isp"></dd>
                </dl>

            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
    var modalMap = null;
    var marker = null;

    function transformDate(d) {
        var s = false;

        if ( arguments.length > 1 ) {
            s = arguments[1];
        }

        var m = moment(d);

        return m.format ( s ? "MMMM D, YYYY, h:mm:ss a" : "MMMM D, YYYY, h:mm a");
    }

    $(function() {
        $(".last-update").html ( transformDate(new Date(), true) );
        $(".local-time").each ( function () {
           var $t = $(this);
           var l = transformDate(new Date($t.data('time')*1000) );
           $t.html(l);
        })
    });

    function createMap() {
        if (modalMap == null) {
            modalMap = L.map('mapCanvasinModal', {
                center: [19.426216, 15.7166481],
                zoom: 2,
                scrollWheelZoom: false,
                tap: false,
                renderer :L.svg()
            });
            var lESRI = L.tileLayer('//services.arcgisonline.com/arcgis/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
                {
                    maxZoom : 20,
                    attribution : ''
                });
            modalMap.addLayer(lESRI);
        }
    }


    $('#geopos').on('shown.bs.modal', function (e) {
            $("#mapCanvasinModal").css("width", $("div.modal-body").width() + "px");

            createMap();


            var $r = $(e.relatedTarget);
            var lat = Number($r.data('lat'));
            var lng = Number($r.data('lng'));
            $("#geocoords").html(lat + "," + lng);

            modalMap.setZoom(13);
            modalMap.panTo([lat,lng]);

            var m = L.marker([lat, lng], {});
            modalMap.addLayer(m);

            var $r = $(e.relatedTarget);
            var ip = $r.data('ip');
            var ipd = $r.data('ipd');

            var popup = $(this);
            var location = $r.data('location');

            if ( $r.data('link') ) {
                location = '<a href="'+$r.data('link')+'">' + location + '</a>';
            }

            popup.find ( ".location").html(location);
            popup.find ( ".ip").html ("<a target='_blank' href='http://whatismyipaddress.com/ip/" + ip + "'>" + ip + "</a>");
            popup.find ( ".org").html('');
            popup.find ( ".isp").html('');

            $.ajax({
                type: "POST",
                url: "/ajax/ipinfo",
                timeout: 15000,
                dataType: "json",
                data: { 'ipd' : ipd, 'id' : 85 },
                complete: function(){
                },
                success: function(data, textStatus, jqXHR){
                    console.log(data);
                    popup.find(".org").html(data.org);
                    popup.find(".isp").html(data.isp);
                },
                error: function(jqXHR, textStatus, errorThrown ){
                    console.log ( "error occured ", textStatus, errorThrown );
                }
            });


        });


</script>

        </div>
    </div>


<style>
    /* LEAFLET MAP MARKERS */
    @keyframes clustrTrns {
        0% {
            transform: scale(1);
            opacity: 0.2;
        }
        100% {
            /*transform-origin: left top;*/
            transform: scale(0.15);
            /*border: 2px solid #3c3b3b;*/
            border: 2px solid white;
            opacity: 0.7;
        }
    }

    .css-icon {

    }

    .mnAnim {
        position: absolute;
        margin-top: -9px;
        margin-left: -9px;
        border-radius: 50%;
        height: 36px;
        width: 36px;
        background: #FF0000;

        animation: clustrTrns 2s;
        /*animation-delay: 3s;*/
        animation-fill-mode: forwards;
    }

    .mn_old {
        position: absolute;
        border-radius: 50%;
        height: 7px;
        width: 7px;
        background: #FF0000;
        animation-fill-mode: forwards;
        border: 1px solid white;
        opacity: 0.7;
    }

    path.mn:hover {
        stroke-width: 2;
    }

</style>

<script>

    var last_hit_id = 16418190886;
    var row_count_in_table = 30
    var live_orange_dots = true;
    var backlink_advanced = false;
    var recent_visits_count = 50;


    var history = {"g4hap12t26rev4ea447orasa1d":[{"date":"January 29, 2026, 3:46 pm","timestamp":1769701560}],"d4tue5a2l727sbggffcb1dh01r":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701556}],"7pcahh1p4kd6snsorqmr1nc4r5":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701553}],"ibe4tikigor68s0ut83i405lmt":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701544},{"date":"January 29, 2026, 3:45 pm","timestamp":1769701541}],"vrpbohjr9bj1h3qhc6ekt93i6m":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701542},{"date":"January 29, 2026, 3:45 pm","timestamp":1769701515}],"bqtffiktrm4bn9cc3vdet4ndgt":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701540}],"6qre91pmg888atnjpphkn70jke":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701538}],"85e66rh09hcbfdc57bq86p0hl1":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701535}],"gjq858im36rde2p87h5rlkapn2":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701532}],"alg53v4k6ugek6k9tees9var1q":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701531}],"7vjm8lv8qb2j1jq1c1vg645j9e":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701531},{"date":"January 29, 2026, 3:45 pm","timestamp":1769701528},{"date":"January 29, 2026, 3:45 pm","timestamp":1769701526}],"sem22mf391g6tiu2pjoc2a4uq6":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701526}],"rsm153pll12pg5qj75h0v0ik77":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701513}],"rm68c3r7l0bk8bad2jnllusc5e":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701513},{"date":"January 29, 2026, 3:45 pm","timestamp":1769701501}],"1ek2dtnrgkmqe9p0h6esmltii0":[{"date":"January 29, 2026, 3:45 pm","timestamp":1769701501}],"j8nvhvo1m5boai6rpnjh4eivd3":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701488}],"g4kuag90ifr712ng1ebq0mh1qe":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701483}],"3pvjc104074mpn8lq13bmfmf9m":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701482}],"r80rshv5uqnf29vi0nt6edkovb":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701478},{"date":"January 29, 2026, 3:38 pm","timestamp":1769701108}],"u7b4emt7d4uhtdle751knq4ffu":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701473}],"qr20eflenkt9iea87h2tkm9400":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701464}],"g0brguteoi1lgj74ik17smoond":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701464}],"5hj00sl30vh4g8m3je2pojiunn":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701462}],"2806thbsbbhi0ah5kllgtfnk0u":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701458},{"date":"January 29, 2026, 3:43 pm","timestamp":1769701430},{"date":"January 29, 2026, 3:41 pm","timestamp":1769701278},{"date":"January 29, 2026, 3:37 pm","timestamp":1769701068}],"oovqp6ehqavg67gk19thv8f21a":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701455}],"ovmtm8bakr77hpichp53tqbcjt":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701451}],"36m4il7lfvqpui1gbi8mm7uqap":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701444},{"date":"January 29, 2026, 3:42 pm","timestamp":1769701320},{"date":"January 29, 2026, 3:38 pm","timestamp":1769701132}],"it1eoed9tj48ubd672dpvc8vth":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701441}],"i1ofo0988cl7bokock78eq6aa6":[{"date":"January 29, 2026, 3:44 pm","timestamp":1769701440}],"7ulq33kbhmoi6ehkfhjfr53rd0":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701433}],"8lf8af91tverl3tca1gumjimdf":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701423}],"npt13fcvfdqbql8rrrvkldgr65":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701419},{"date":"January 29, 2026, 3:36 pm","timestamp":1769700979}],"tdqf8cfnip45pnjvb3vcev2lsm":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701416}],"bmeb3poumjmutjkk8k79ks2k88":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701410}],"htm7htduvmimkiqmp6c6afjsve":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701407}],"7mspi7uc1e5p8pujonuk5o2cn6":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701407}],"8mgnrlmod4b4j7i4f292qpn7it":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701403}],"4kvvshjs6ijb5c5qantb2pe0h1":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701397}],"0474lg0n2atco1v54gpfbro47u":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701396}],"s57tm29s0o7i93r72qcaadrmhk":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701395}],"f0nodco05mut3fs3tupbcc4d6u":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701386}],"da3rl73pvoivm8r7me5lphbd99":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701384}],"c7peh8id4vfjm0imghasiq36fs":[{"date":"January 29, 2026, 3:43 pm","timestamp":1769701383}],"20pp37m65auniqi3d89c48k689":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701376}],"iq2pdo8bmqc091kuukht9u9eue":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701371}],"343o950bpn321pl25vvjjklqai":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701370}],"d8m6j6t9e6bj3432is3t4nna6a":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701363}],"7ls1qfo0nfkgomeeteki8s773m":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701361}],"258fnhgd7d7mlt54a008tvkhbu":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701358},{"date":"January 29, 2026, 3:42 pm","timestamp":1769701355}],"d292gg200bm7qi7rh8go5k15pr":[{"date":"January 29, 2026, 3:42 pm","timestamp":1769701353}]};

    var map = L.map('map', {
        center: [19.426216, 15.7166481],
        zoom: 2,
        scrollWheelZoom: false,
        tap: false,
        renderer :L.svg()
    });

    var lOSM = new L.TileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        maxZoom: 18,
        attribution: 'Get your <a href="/">free counter</a> with map',
    });

    var lMapbox = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiY2x1c3RybWFwcyIsImEiOiJjaXEwbG9hZXowMDByaHJuZDU0dDU0cDZ0In0.RDTRO6skanUfOnb6eijYEA', {
        maxZoom: 18,
        attribution: 'Get your <a href="/">free counter</a> with map',
        id: 'mapbox.streets'
    });

    //var lGoogle = new L.Google("ROADMAP",
    //    {attribution: 'Get your <a href="/">free counter</a> with map', tap: false, draggable: false});
    //var lBing = new L.BingLayer("LfO3DMI9S6GnXD7d0WGs~bq2DRVkmIAzSOFdodzZLvw~Arx8dclDxmZA0Y38tHIJlJfnMbGq5GXeYmrGOUIbS2VLFzRKCK0Yv_bAl6oe-DOc", {type: 'Road'});


    var OpenMapSurfer_Roads = L.tileLayer('http://korona.geog.uni-heidelberg.de/tiles/roads/x={x}&y={y}&z={z}', {
        maxZoom: 20,
        attribution: 'Get your <a href="/">free counter</a> with map'
    });

    var lESRI = L.tileLayer('//services.arcgisonline.com/arcgis/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
        {
           maxZoom : 20,
           attribution : ''
        });


    map.addLayer(lESRI);

    map.addControl(new L.Control.Layers({
        'WorldStreetMap' : lESRI,
        'OpenMap': OpenMapSurfer_Roads,
        'OpenStreetMap': lOSM,
        'MapBox': lMapbox
        //'Google': lGoogle
        //'Bing': lBing,
    }));


    var addressPoints = [["50.2981000","57.1814000","Aqt\u00f6be, Kazakhstan",40,1],["27.9032000","-82.2911000","Brandon, United States",40,1],["55.6415000","12.0803000","Roskilde, Denmark",41,1],["-33.5000000","-70.6667000","San Miguel, Chile",41,1],["43.1056000","131.8735000","Vladivostok, Russia",41,1],["42.8800000","-73.9913000","Schenectady, United States",41,1],["33.8405000","-117.9526000","Anaheim, United States",41,1],["33.2710000","-97.2691000","Krum, United States",41,1],["23.8997000","106.6133000","Baise City, China",41,1],["22.9667000","113.7667000","Baima, China",41,1],["38.9538000","-76.8947000","Hyattsville, United States",41,1],["39.6200000","19.9197000","Corfu, Greece",41,1],["44.9863000","-92.7278000","Hudson, United States",41,1],["26.2823000","-98.1825000","Edinburg, United States",41,1],["42.2789000","-85.6904000","Kalamazoo, United States",41,1],["32.3617000","-116.7366000","Tijuana, Mexico",41,1],["34.5392000","-93.0653000","Hot Springs, United States",41,1],["25.0000000","17.0000000","Libya",41,1],["14.6466000","121.0509000","Quezon City, Philippines",41,1],["40.3916000","-111.8508000","Lehi, United States",41,1],["43.3894000","-80.4290000","Kitchener, Canada",41,1],["42.4154000","-71.1564000","Arlington, United States",41,1],["49.6067000","5.8553000","Selange, Belgium",42,1],["18.0000000","-76.8000000","Kingston, Jamaica",42,1],["48.9215000","24.7097000","Ivano-Frankivs'k, Ukraine",42,1],["39.6253000","-104.7863000","Aurora, United States",42,1],["-34.9274000","138.6005000","Adelaide, Australia",42,1],["22.5000000","114.1333000","Fanling, Hong Kong",42,1],["49.9808000","8.2422000","Mainz, Germany",42,1],["45.8155000","8.7988000","Varese, Italy",42,1],["61.0042000","69.0019000","Khanty-Mansiysk, Russia",42,1],["19.0000000","-70.6667000","Dominican Republic",42,1],["51.4170000","-1.3313000","Newbury, United Kingdom",42,1],["41.0155000","-73.8635000","Dobbs Ferry, United States",42,1],["33.0812000","-96.8133000","Plano, United States",42,1],["38.6419000","-77.3463000","Woodbridge, United States",43,1],["37.0695000","-8.1006000","Quarteira, Portugal",43,1],["41.0799000","-80.6392000","Youngstown, United States",43,1],["40.7182000","-74.0476000","Jersey City, United States",43,1],["38.8817000","-92.4020000","Columbia, United States",43,1],["36.4300000","136.5829000","Nomi, Japan",43,1],["37.9545000","-121.9759000","Concord, United States",43,1],["6.2529000","-75.5646000","Medell\u00edn, Colombia",43,1],["27.4843000","-82.5813000","Bradenton, United States",43,1],["40.5412000","-119.5869000","Empire, United States",43,1],["39.7897000","-75.0355000","Blackwood, United States",43,1],["22.0000000","98.0000000","Myanmar [Burma]",43,1],["51.5927000","-2.9637000","Newport, United Kingdom",43,1],["32.0000000","35.2500000","Palestine",43,1],["41.3626000","-74.2713000","Chester, United States",43,1],["23.4050000","116.4586000","Buwei, China",44,1],["44.8166000","20.4721000","Belgrade, Serbia",44,1],["36.6621000","117.0104000","Jinan, China",44,1],["44.3167000","23.8000000","Craiova, Romania",44,1],["33.9553000","-117.2457000","Moreno Valley, United States",44,1],["49.8486000","24.0323000","Lviv, Ukraine",44,1],["32.5484000","-85.4682000","Auburn, United States",44,1],["19.1500000","77.3333000","Nanded, India",44,1],["52.2385000","6.8706000","Enschede, Netherlands",44,1],["-25.8841000","-48.5667000","Guaratuba, Brazil",44,1],["54.7817000","32.0400000","Smolensk, Russia",44,1],["53.8103000","-1.5846000","Leeds, United Kingdom",44,1],["41.6017000","-87.9557000","Homer Glen, United States",44,1],["36.9780000","-121.8940000","Aptos, United States",45,1],["30.7324000","76.7950000","Chandigarh, India",45,1],["37.7562000","-121.7700000","Livermore, United States",45,1],["-21.2503000","-43.8417000","Barbacena, Brazil",45,1],["46.4355000","30.4104000","Petrodolynske, Ukraine",45,1],["40.7876000","-74.0600000","Secaucus, United States",45,1],["30.2360000","-92.0075000","Lafayette, United States",45,1],["41.8388000","-87.7891000","Berwyn, United States",45,1],["47.0667000","21.9333000","Oradea, Romania",45,1],["48.7667000","9.1833000","Stuttgart, Germany",45,1],["47.5567000","8.5055000","Glattfelden, Switzerland",45,1],["28.3526000","-82.6301000","Hudson, United States",45,1],["54.5833000","-5.9333000","Belfast, United Kingdom",45,1],["-20.3167000","-40.3500000","Vit\u00f3ria, Brazil",46,1],["25.1137000","113.3541000","Lecheng, China",46,1],["40.1262000","-75.5268000","Phoenixville, United States",46,1],["37.3605000","-79.0578000","Lynchburg, United States",46,1],["45.6199000","9.0354000","Saronno, Italy",46,1],["21.7264000","111.7117000","Baitu, China",46,1],["35.2719000","128.8402000","Gimhae, Republic of Korea",46,1],["53.4003000","-2.2154000","Cheadle, United Kingdom",46,1],["-23.2030000","-46.9008000","Jundia\u00ed, Brazil",46,1],["29.8986000","-98.7217000","Boerne, United States",46,1],["9.2389000","98.9786000","Wiphawadi, Thailand",46,1],["34.1091000","-117.7126000","Claremont, United States",46,1],["41.3187000","-81.8318000","Strongsville, United States",46,1],["59.3037000","10.4237000","T\u00f8nsberg, Norway",47,1],["41.9913000","43.4753000","Georgia",47,1],["42.0048000","-87.9954000","Elk Grove Village, United States",47,1],["42.2649000","-72.6687000","Easthampton, United States",47,1],["40.8492000","-73.9735000","Fort Lee, United States",47,1],["36.0765000","-79.7947000","Greensboro, United States",47,1],["33.4935000","-111.9211000","Scottsdale, United States",48,1],["33.6007000","73.0679000","Rawalpindi, Pakistan",48,1],["45.6737000","9.6120000","Treviolo, Italy",48,1],["41.1496000","-8.6110000","Porto, Portugal",48,1],["41.7689000","-71.4758000","Cranston, United States",49,1],["32.0806000","34.8142000","Ramat Gan, Israel",49,1],["26.0276000","-80.2528000","Hollywood, United States",49,1],["33.9803000","-118.4517000","Marina del Rey, United States",49,1],["7.0000000","81.0000000","Sri Lanka",49,1],["-33.9258000","18.4232000","Cape Town, South Africa",49,1],["59.5764000","30.1283000","Gatchina, Russia",49,1],["47.3121000","-122.3661000","Federal Way, United States",49,1],["38.7054000","-0.4743000","Alcoy, Spain",49,1],["45.9540000","12.5053000","Sacile, Italy",49,1],["25.9487000","-80.2819000","Opa-locka, United States",49,1],["56.3287000","44.0020000","Nizhniy Novgorod, Russia",49,1],["33.8104000","-118.3531000","Torrance, United States",49,1],["45.5999000","-121.1871000","The Dalles, United States",49,1],["35.1063000","-114.5925000","Bullhead City, United States",49,1],["45.5765000","-94.4206000","Collegeville, United States",50,1],["31.3256000","75.5792000","Jalandhar, India",50,1],["50.8489000","5.6953000","Maastricht, Netherlands",50,1],["34.1453000","-117.3005000","San Bernardino, United States",50,1],["33.0924000","-117.2624000","Carlsbad, United States",50,1],["45.8485000","8.9364000","Stabio, Switzerland",50,1],["42.4178000","-71.1134000","Medford, United States",50,1],["6.8753000","79.8611000","Colombo, Sri Lanka",50,1],["42.1212000","-87.8405000","Northbrook, United States",50,1],["47.1367000","-88.5654000","Hancock, United States",50,1],["26.6786000","-82.0263000","Cape Coral, United States",50,1],["41.7688000","-88.1425000","Naperville, United States",51,1],["44.4938000","11.3387000","Bologna, Italy",51,1],["-23.9613000","-46.3910000","Sao Vicente, Brazil",51,1],["35.8377000","51.0107000","Karaj, Iran",51,1],["-22.9193000","-42.8206000","Marica, Brazil",51,1],["37.4386000","127.1378000","Seongnam-si, Republic of Korea",51,1],["35.7439000","139.6461000","Nerima, Japan",51,1],["33.2486000","126.5628000","Seogwipo, South Korea",51,1],["36.7539000","-119.7085000","Fresno, United States",51,1],["47.2000000","-122.3153000","Puyallup, United States",51,1],["45.8314000","3.0811000","Blanzat, France",51,1],["51.2922000","6.8485000","Ratingen, Germany",52,1],["33.8542000","-83.4080000","Watkinsville, United States",52,1],["22.3167000","114.1667000","Tai Kok Tsui, Hong Kong",52,1],["39.4667000","16.0000000","Guardia Piemontese, Italy",52,1],["47.3066000","-122.2619000","Auburn, United States",52,1],["42.7978000","-83.7049000","Fenton, United States",52,1],["32.2187000","74.2218000","Gujranwala, Pakistan",52,1],["25.3210000","114.9044000","Zhenjiang, China",52,1],["30.3539000","31.2007000","Toukh, Egypt",52,1],["2.5000000","112.5000000","Malaysia",52,1],["34.2670000","-80.5913000","Camden, United States",52,1],["43.1819000","-83.7238000","Clio, United States",52,1],["33.3944000","-84.7083000","Newnan, United States",52,1],["37.4562000","126.7288000","Incheon, Republic of Korea",53,1],["46.4639000","30.7386000","Odesa, Ukraine",53,1],["10.6000000","-66.9333000","La Guaira, Venezuela",53,1],["51.4834000","6.8798000","Oberhausen, Germany",53,1],["38.6101000","-90.5600000","Ballwin, United States",53,1],["1.0000000","38.0000000","Kenya",53,1],["55.8319000","-4.4322000","Paisley, United Kingdom",53,1],["45.5333000","9.0333000","Rho, Italy",53,1],["30.0997000","-91.9901000","Youngsville, United States",53,1],["-1.9998000","-77.4966000","Ecuador",53,1],["40.8020000","-77.8564000","University Park, United States",53,1],["38.7043000","-77.2278000","Lorton, United States",53,1],["24.8602000","67.0363000","Saddar, Pakistan",54,1],["22.2000000","113.5500000","Macao, Macao",54,1],["43.1361000","-77.4648000","Penfield, United States",54,1],["42.2831000","-71.7237000","Shrewsbury, United States",54,1],["36.0450000","-84.0396000","Powell, United States",54,1],["45.6960000","9.6672000","Bergamo, Italy",54,1],["26.4122000","-80.0875000","Boca Raton, United States",54,1],["36.9500000","35.3500000","Adana, Turkey",54,1],["32.9408000","117.3608000","Bengbu, China",54,1],["37.2336000","127.2010000","Yongin-si, Republic of Korea",54,1],["53.5755000","10.0174000","Hamburg, Germany",54,1],["46.9420000","-122.6060000","Yelm, United States",54,1],["38.9994000","-77.0336000","Silver Spring, United States",55,1],["37.4951000","127.0628000","Gangnam-gu, Republic of Korea",55,1],["45.5970000","25.5525000","Bra\u015fov, Romania",55,1],["42.7377000","-84.5239000","Lansing, United States",55,1],["35.2327000","-91.7054000","Searcy, United States",55,1],["50.8847000","4.5049000","Brussels, Belgium",55,1],["42.0521000","-71.8486000","Webster, United States",55,1],["-33.8753000","151.1892000","Glebe, Australia",55,1],["-12.6975000","-38.3242000","Cama\u00e7ari, Brazil",55,1],["33.9253000","-84.5413000","Marietta, United States",55,1],["47.3972000","8.6187000","Dubendorf, Switzerland",55,1],["34.2647000","-118.5231000","Granada Hills, United States",55,1],["29.1565000","-82.2095000","Ocala, United States",55,1],["24.9878000","118.4983000","Putian, China",56,1],["28.5311000","-80.8523000","Titusville, United States",56,1],["42.2994000","69.6060000","Shymkent, Kazakhstan",56,1],["24.6537000","46.7152000","Riyadh, Saudi Arabia",56,1],["13.8333000","-88.9167000","El Salvador",56,1],["54.6197000","39.7400000","Ryazan, Russia",56,1],["23.1681000","114.2809000","Luoyang, China",56,1],["24.0740000","120.5384000","Chang-hua, Taiwan",56,1],["31.2500000","121.4892000","Hongkou, China",56,1],["22.3167000","114.2333000","Mau Ping, Hong Kong",56,1],["41.6786000","-73.0886000","Thomaston, United States",56,1],["47.0056000","28.8575000","Chi\u015fin\u0103u, Republic of Moldova",56,1],["51.9475000","0.1355000","Bishop's Stortford, United Kingdom",57,1],["33.9225000","-117.5472000","Norco, United States",57,1],["23.0333000","72.6167000","Ahmedabad, India",57,1],["23.5915000","111.9109000","Bantang, China",57,1],["32.2489000","34.8432000","Yaqum, Israel",57,1],["40.5595000","-79.9587000","Allison Park, United States",57,1],["42.8731000","74.6003000","Bishkek, Kyrgyzstan",57,1],["32.0000000","-5.0000000","Morocco",57,1],["33.2077000","-117.3480000","Oceanside, United States",57,1],["41.3253000","19.8184000","Tirana, Albania",58,1],["39.9317000","119.5883000","Qinhuangdao, China",58,1],["51.4255000","5.5064000","Eindhoven, Netherlands",58,1],["35.1638000","33.3639000","Nicosia, Cyprus",58,1],["-27.4732000","153.0215000","Brisbane, Australia",58,1],["14.6000000","120.9667000","Manila, Philippines",58,1],["25.0731000","111.2180000","Fuxi, China",58,1],["37.1882000","-3.6067000","Granada, Spain",59,1],["-12.2500000","-38.9500000","Feira de Santana, Brazil",59,1],["30.5045000","-97.8209000","Cedar Park, United States",59,1],["22.4000000","113.9833000","Tuen Mun, Hong Kong",59,1],["50.1208000","-122.9544000","Whistler, Canada",59,1],["37.8916000","-4.7727000","Cordova, Spain",59,1],["-23.3128000","-51.1596000","Londrina, Brazil",59,1],["37.2859000","127.0099000","Suwon-si, Republic of Korea",59,1],["35.7679000","139.7965000","Adachi-ku, Japan",59,1],["33.7523000","130.7315000","Fukuoka, Japan",59,1],["23.7667000","116.6608000","Anbian, China",60,1],["43.4473000","-88.2139000","West Bend, United States",60,1],["41.6561000","-0.8773000","Zaragoza, Spain",60,1],["57.7072000","11.9668000","Gothenburg, Sweden",60,1],["43.2211000","-79.7994000","Hamilton, Canada",60,1],["24.9869000","121.3056000","Taoyuan, Taiwan",60,1],["41.7030000","-83.5710000","Toledo, United States",60,1],["28.0000000","3.0000000","Algeria",60,1],["39.4914000","-119.8435000","Reno, United States",60,1],["22.3167000","114.2167000","Kwun Hang, Hong Kong",61,1],["-6.8227000","39.2910000","Tanzania",61,1],["47.1899000","18.4103000","Sz\u00e9kesfeh\u00e9rv\u00e1r, Hungary",61,1],["33.5504000","-101.8871000","Lubbock, United States",61,1],["35.5980000","-84.4628000","Sweetwater, United States",61,1],["23.7325000","115.7722000","Jingli, China",61,1],["28.5800000","77.3300000","Noida, India",61,1],["52.5931000","19.0894000","Warzachewka Polska, Poland",61,1],["41.6344000","-91.5054000","Iowa City, United States",62,1],["47.6689000","-117.4369000","Spokane, United States",62,1],["48.6844000","6.1850000","Nancy, France",62,1],["38.8851000","-76.8891000","Capitol Heights, United States",62,1],["13.7702000","100.6853000","Saphan Sung, Thailand",63,1],["43.1061000","-75.2336000","Utica, United States",63,1],["36.0162000","-80.0434000","High Point, United States",63,1],["40.5000000","47.5000000","Azerbaijan",63,1],["40.8364000","-74.1403000","Clifton, United States",63,1],["43.5443000","10.3262000","Livorno, Italy",63,1],["2.2270000","102.2396000","Malacca, Malaysia",63,1],["35.7795000","139.5419000","Niiza, Japan",63,1],["24.8047000","120.9714000","Hsinchu, Taiwan",64,1],["40.7336000","-96.6394000","Lincoln, United States",64,1],["21.7133000","110.1846000","Gaocun, China",64,1],["22.6363000","111.1131000","Guizi, China",64,1],["34.1607000","-118.2264000","Glendale, United States",64,1],["38.0031000","-121.9172000","Pittsburg, United States",65,1],["23.6821000","110.4910000","Fucheng, China",65,1],["45.8119000","-66.6763000","Fredericton, Canada",65,1],["33.3950000","-86.8348000","Birmingham, United States",65,1],["39.5000000","-8.0000000","Portugal",65,1],["-25.2939000","-57.6111000","Asunci\u00f3n, Paraguay",65,1],["47.1167000","51.8833000","Atyrau, Kazakhstan",65,1],["39.6087000","-110.7995000","Price, United States",66,1],["33.9388000","-117.4160000","Riverside, United States",66,1],["41.7454000","-86.1387000","Granger, United States",66,1],["-31.6333000","-60.7000000","Santa Fe, Argentina",66,1],["21.7611000","110.5562000","Baihua, China",66,1],["52.0045000","4.3728000","Delft, Netherlands",66,1],["37.7202000","-89.2157000","Carbondale, United States",67,1],["37.3479000","-122.0351000","Sunnyvale, United States",67,1],["37.3230000","-122.0322000","Cupertino, United States",67,1],["37.5333000","126.9667000","Yongsan-dong, Republic of Korea",67,1],["51.6664000","39.1700000","Voronezh, Russia",67,1],["28.0164000","-81.9554000","Lakeland, United States",67,1],["16.7500000","107.2000000","Quang Tri, Vietnam",67,1],["37.8670000","112.5346000","Taiyuanshi, China",67,1],["28.6354000","-81.4888000","Apopka, United States",68,1],["46.9258000","7.4145000","Bern \/ Liebefeld, Switzerland",68,1],["38.4434000","-122.7088000","Santa Rosa, United States",68,1],["46.0967000","18.2068000","P\u00e9cs, Hungary",68,1],["45.4333000","-73.7500000","Pointe-Claire, Canada",68,1],["30.0080000","31.2194000","Giza, Egypt",68,1],["40.6568000","-75.3912000","Bethlehem, United States",68,1],["39.4899000","-74.4773000","Absecon, United States",68,1],["40.8167000","14.6167000","Sarno, Italy",68,1],["-37.9108000","145.1332000","Clayton, Australia",68,1],["46.7667000","23.6000000","Cluj-Napoca, Romania",68,1],["33.5674000","-117.1758000","Murrieta, United States",69,1],["39.3773000","-76.5397000","Parkville, United States",69,1],["29.5628000","106.5528000","Chongqing, China",69,1],["42.1362000","-0.4087000","Huesca, Spain",69,1],["35.6525000","-85.7284000","McMinnville, United States",69,1],["41.4939000","-73.0517000","Naugatuck, United States",69,1],["38.2689000","140.8719000","Sendai, Japan",69,1],["28.9338000","-81.9914000","The Villages, United States",69,1],["40.7333000","14.6333000","Nocera Inferiore, Italy",69,1],["39.0013000","-76.8880000","Greenbelt, United States",69,1],["20.4429000","110.1946000","Beigou, China",69,1],["50.9166000","5.9642000","Heerlen, Netherlands",70,1],["36.0986000","120.3719000","Qingdao, China",70,1],["33.8775000","-84.5017000","Smyrna, United States",70,1],["45.4080000","11.8859000","Padua, Italy",70,1],["9.9333000","-84.0833000","San Jos\u00e9, Costa Rica",70,1],["-22.4000000","-49.4167000","Duartina, Brazil",70,1],["37.8358000","112.4767000","Dajingyu, China",71,1],["33.3072000","-87.5859000","Tuscaloosa, United States",71,1],["39.6062000","-84.1695000","Dayton, United States",71,1],["53.3444000","-3.0124000","Wirral, United Kingdom",71,1],["22.7725000","114.8464000","Daling, China",72,1],["45.4334000","-76.3494000","Arnprior, Canada",72,1],["20.3667000","72.9000000","Vapi, India",72,1],["30.0409000","-95.5302000","Spring, United States",73,1],["36.8560000","30.7523000","Antalya, Turkey",73,1],["29.8667000","77.8833000","Roorkee, India",73,1],["43.7387000","-79.7271000","Brampton, Canada",73,1],["33.7540000","-117.8578000","Santa Ana, United States",73,1],["37.9269000","-122.3313000","Richmond, United States",73,1],["37.9060000","-122.5450000","Mill Valley, United States",73,1],["49.5986000","10.9675000","Erlangen, Germany",74,1],["49.4050000","11.1617000","Nuremberg, Germany",74,1],["34.1230000","-117.8988000","Azusa, United States",74,1],["22.5697000","88.3697000","Kolkata, India",74,1],["45.2525000","-122.6824000","Canby, United States",74,1],["51.0500000","3.7167000","Ghent, Belgium",74,1],["35.9151000","-79.0972000","Chapel Hill, United States",74,1],["18.2500000","-66.5000000","Puerto Rico",74,1],["38.7210000","-75.0752000","Rehoboth Beach, United States",74,1],["41.2241000","-73.0517000","Milford, United States",75,1],["42.2423000","-71.8099000","Worcester, United States",75,1],["28.6627000","121.4331000","Taizhou, China",76,1],["29.3099000","30.8418000","Al Fayyum, Egypt",76,1],["45.2653000","21.9162000","Re\u015fi\u0163a, Romania",76,1],["52.7237000","6.9883000","Klazienaveen, Netherlands",77,1],["29.4843000","-81.2042000","Palm Coast, United States",77,1],["28.5978000","-81.3024000","Winter Park, United States",77,1],["61.7037000","27.2543000","Mikkeli, Finland",77,1],["45.0333000","25.4167000","Branesti, Romania",77,1],["46.7314000","-117.1733000","Pullman, United States",77,1],["26.2822000","-80.1156000","Pompano Beach, United States",77,1],["33.9562000","-83.9880000","Lawrenceville, United States",77,1],["49.8119000","73.0969000","Karagandy, Kazakhstan",77,1],["42.3026000","-71.4306000","Framingham, United States",77,1],["49.1135000","18.2144000","Dubnica nad V\u00e1hom, Slovak Republic",78,1],["45.8293000","15.9793000","Zagreb, Croatia",78,1],["29.9737000","32.5263000","Suez, Egypt",78,1],["40.6027000","-75.4778000","Allentown, United States",78,1],["14.3294000","120.9367000","Dasmarinas, Philippines",78,1],["51.2167000","3.2333000","Bruges, Belgium",79,1],["46.5160000","6.6328000","Lausanne, Switzerland",79,1],["15.5000000","-90.2500000","Guatemala",79,1],["23.4442000","115.7992000","Beikeng, China",79,1],["41.3171000","69.2494000","Tashkent, Uzbekistan",80,1],["26.3580000","114.9895000","Shixing, China",80,1],["39.2564000","-119.9521000","Incline Village, United States",80,1],["40.5859000","-74.6832000","Somerville, United States",80,1],["38.4063000","-121.4287000","Elk Grove, United States",80,1],["35.0388000","137.1197000","Nagoya-shi, Japan",81,1],["48.1533000","16.1714000","Laab im Walde, Austria",81,1],["55.9722000","37.9306000","Ivanteyevka, Russia",81,1],["56.9496000","24.0978000","Riga, Latvia",81,1],["26.8393000","80.9231000","Lucknow, India",82,1],["41.2377000","-95.9998000","Omaha, United States",82,1],["52.1929000","0.1256000","Cambridge, United Kingdom",82,1],["31.8775000","-106.6084000","El Paso, United States",82,1],["36.7968000","-76.1767000","Virginia Beach, United States",82,1],["40.6673000","-73.4593000","Massapequa, United States",82,1],["42.2328000","-8.7226000","Vigo, Spain",82,1],["40.7001000","-73.9057000","Dodgewood, United States",82,1],["45.0328000","38.9769000","Krasnodar, Russia",82,1],["44.7321000","-85.8581000","Lake Ann, United States",83,1],["41.6999000","2.8456000","Lloret de Mar, Spain",83,1],["-16.6402000","-49.2599000","Goi\u00e2nia, Brazil",83,1],["35.3879000","-118.9861000","Bakersfield, United States",83,1],["37.8611000","-122.2564000","Berkeley, United States",84,1],["31.2378000","121.4781000","Huangpu, China",84,1],["41.1371000","-85.0637000","Fort Wayne, United States",84,1],["43.9215000","-78.9412000","Whitby, Canada",85,1],["31.4166000","31.8105000","Damietta, Egypt",85,1],["35.7183000","139.7612000","Bunkyo-ku, Japan",85,1],["40.7434000","-73.0761000","Sayville, United States",85,1],["34.0297000","-84.1469000","Duluth, United States",85,1],["40.8695000","-72.8868000","Upton, United States",86,1],["23.3265000","116.5049000","Yanqianlaocun, China",86,1],["50.8977000","14.8076000","Zittau, Germany",86,1],["21.6467000","110.2817000","Lianjiang, China",86,1],["-12.0433000","-77.0283000","Peru",86,1],["41.0014000","-91.9578000","Fairfield, United States",86,1],["52.0333000","113.5500000","Chita, Russia",87,1],["50.9745000","9.7956000","Bebra, Germany",87,1],["10.5048000","-66.9208000","Caracas, Venezuela",88,1],["33.4294000","-112.3896000","Goodyear, United States",88,1],["40.4609000","115.9715000","Yanqing, China",88,1],["29.9198000","-89.9990000","New Orleans, United States",88,1],["-23.2758000","-50.9125000","Jataizinho, Brazil",89,1],["35.7395000","139.8672000","Katsushika-ku, Japan",89,1],["38.6374000","0.0478000","Calpe, Spain",89,1],["48.8763000","-72.2120000","Dolbeau-Mistassini, Canada",89,1],["39.2891000","-76.5583000","Baltimore, United States",90,1],["-1.2841000","36.8155000","Nairobi, Kenya",90,1],["40.4394000","113.1536000","Fengzhen, China",90,1],["42.0586000","-87.6845000","Evanston, United States",90,1],["7.9500000","98.3564000","Phuket, Thailand",90,1],["22.3333000","114.1500000","Sham Shui Po, Hong Kong",90,1],["38.7907000","-121.2358000","Rocklin, United States",91,1],["32.3098000","-110.9150000","Tucson, United States",91,1],["35.0074000","-80.9451000","Fort Mill, United States",92,1],["38.0513000","-84.4990000","Lexington, United States",92,1],["35.6331000","139.7020000","Meguro-ku, Japan",92,1],["51.2446000","7.1655000","Wuppertal, Germany",93,1],["33.4125000","-111.8319000","Mesa, United States",93,1],["38.5559000","-121.7391000","Davis, United States",93,1],["33.3201000","-111.8739000","Chandler, United States",93,1],["37.3590000","-122.0866000","Los Altos, United States",93,1],["47.1173000","-88.5535000","Houghton, United States",94,1],["49.2488000","5.0676000","Very, France",94,1],["23.6198000","113.1024000","Anfeng, China",94,1],["45.5333000","9.2333000","Sesto San Giovanni, Italy",94,1],["38.7167000","-9.1333000","Lisbon, Portugal",94,1],["14.5501000","121.0360000","Makati City, Philippines",95,1],["62.2011000","34.2767000","Kondopoga, Russia",95,1],["65.3333000","21.5000000","Pite\u00e5, Sweden",96,1],["41.8298000","-86.2542000","Niles, United States",96,1],["23.1833000","75.7667000","Ujjain, India",96,1],["18.4667000","-69.9000000","Santo Domingo, Dominican Republic",97,1],["36.9135000","-76.2826000","Norfolk, United States",97,1],["43.5898000","-79.7599000","Mississauga, Canada",97,1],["43.2956000","-2.9973000","Barakaldo, Spain",97,1],["53.2000000","-2.9167000","Chester, United Kingdom",97,1],["53.3528000","7.2184000","Emden, Germany",97,1],["34.0240000","-84.2396000","Alpharetta, United States",97,1],["40.7930000","-74.0247000","North Bergen, United States",98,1],["40.7970000","-81.5751000","Massillon, United States",98,1],["38.8511000","-104.7688000","Colorado Springs, United States",98,1],["35.6004000","139.6815000","\u014cta-ku, Japan",99,1],["40.8627000","-73.6351000","Glen Cove, United States",99,1],["42.5134000","-83.0647000","Warren, United States",99,1],["43.5610000","-116.2135000","Boise, United States",99,1],["22.3333000","114.2500000","Tseung Kwan O, Hong Kong",99,1],["39.8897000","115.2750000","Hebei, China",100,1],["48.3000000","16.3500000","Vienna, Austria",100,1],["35.4639000","48.8763000","Gostar, Iran",100,1],["40.8106000","111.6522000","Hohhot, China",100,1],["33.0000000","44.0000000","Iraq",100,1],["38.2723000","-121.2976000","Galt, United States",100,1],["47.7698000","9.1714000","Uberlingen, Germany",101,1],["50.7971000","-2.4013000","Dorchester, United Kingdom",101,1],["44.4914000","26.0602000","Bucharest, Romania",102,1],["39.8147000","-105.1168000","Arvada, United States",103,1],["40.3756000","-74.6597000","Princeton, United States",103,1],["13.7500000","100.4667000","Thailand",103,1],["52.2102000","8.8051000","Bad Oeynhausen, Germany",104,1],["23.4964000","116.2142000","Puning, China",104,1],["-7.1150000","-34.8631000","Jo\u00e3o Pessoa, Brazil",104,1],["25.4015000","112.3554000","Tianxinpu, China",104,1],["44.3697000","-96.7907000","Brookings, United States",105,1],["53.9000000","27.5667000","Minsk, Belarus",105,1],["53.3608000","-1.5084000","Sheffield, United Kingdom",105,1],["28.3089000","-81.3708000","Kissimmee, United States",106,1],["25.0913000","113.7445000","Renhua, China",106,1],["38.8357000","-77.3375000","Fairfax, United States",106,1],["53.5185000","-113.6579000","Edmonton, Canada",106,1],["34.7685000","-112.8815000","Prescott, United States",107,1],["23.5474000","114.8592000","Anquan, China",107,1],["56.8575000","60.6125000","Yekaterinburg, Russia",107,1],["51.1723000","6.3414000","M\u00f6nchengladbach, Germany",107,1],["36.3214000","127.4197000","Daejeon, Republic of Korea",107,1],["45.3973000","-75.6883000","Ottawa, Canada",108,1],["33.7490000","-84.2751000","Decatur, United States",108,1],["46.7333000","17.5500000","Fonyod, Hungary",109,1],["40.3473000","-75.9305000","Reading, United States",109,1],["51.4627000","7.0748000","Essen, Germany",109,1],["33.8321000","-118.1739000","Long Beach, United States",110,1],["38.8810000","-77.1362000","Arlington, United States",111,1],["55.7679000","49.1631000","Kazan\u2019, Russia",111,1],["40.1811000","44.5136000","Yerevan, Armenia",111,1],["25.3924000","68.3737000","Hyderabad, Pakistan",111,1],["39.2353000","-84.4573000","Cincinnati, United States",112,1],["27.9906000","-82.7455000","Clearwater, United States",112,1],["13.0000000","105.0000000","Cambodia",113,1],["37.4538000","-122.1822000","Menlo Park, United States",113,1],["46.4770000","6.4587000","Saint-Prex, Switzerland",114,1],["35.7915000","-78.7811000","Cary, United States",114,1],["55.7000000","13.1833000","Lund, Sweden",114,1],["39.1423000","117.1726000","Tianjin, China",115,1],["47.9005000","-122.2472000","Everett, United States",116,1],["-25.5039000","-49.2908000","Curitiba, Brazil",116,1],["33.5472000","-117.6238000","Ladera Ranch, United States",116,1],["23.2661000","114.7306000","Lankeng, China",116,1],["13.7086000","-89.2031000","San Salvador, El Salvador",119,1],["40.9033000","-74.1579000","Paterson, United States",119,1],["-19.0233000","-48.3348000","Uberlandia, Brazil",120,1],["40.4605000","-80.2858000","Imperial, United States",120,1],["42.3654000","-72.4671000","Amherst, United States",120,1],["35.1496000","126.9156000","Gwangju, Republic of Korea",120,1],["23.5454000","116.2215000","Dongzhoucun, China",121,1],["54.0479000","-2.7977000","Lancaster, United Kingdom",121,1],["42.3765000","-71.2356000","Waltham, United States",121,1],["46.2590000","-0.3443000","Prahecq, France",121,1],["40.1120000","-88.2365000","Champaign, United States",121,1],["28.9684000","50.8385000","Bandar B\u016bshehr, Iran",121,1],["39.3179000","-84.2483000","Maineville, United States",122,1],["55.6560000","12.4799000","Hvidovre, Denmark",122,1],["32.8807000","-117.2359000","La Jolla, United States",122,1],["40.4862000","-74.4518000","New Brunswick, United States",123,1],["35.0387000","-89.9276000","Memphis, United States",123,1],["25.2819000","110.2864000","Guilin, China",124,1],["37.4852000","-122.2364000","Redwood City, United States",124,1],["39.7472000","-75.5918000","Wilmington, United States",125,1],["35.4040000","-78.4153000","Four Oaks, United States",125,1],["50.1559000","18.7792000","Orzesze, Poland",125,1],["21.5848000","110.5211000","Chailing, China",125,1],["59.0000000","26.0000000","Estonia",126,1],["38.2281000","-84.8697000","Frankfort, United States",127,1],["-4.4372000","103.5678000","Uludanau, Indonesia",127,1],["50.9807000","10.3152000","Eisenach, Germany",127,1],["56.0000000","24.0000000","Republic of Lithuania",127,1],["51.1811000","71.4278000","Astana, Kazakhstan",128,1],["41.6181000","-70.4854000","Mashpee, United States",129,1],["23.7349000","115.8142000","Aiche, China",130,1],["34.6836000","113.5325000","Zhengzhou, China",130,1],["27.7709000","-82.6793000","Saint Petersburg, United States",130,1],["32.7185000","-97.1432000","Arlington, United States",130,1],["-19.8993000","-43.9570000","Belo Horizonte, Brazil",130,1],["40.0000000","45.0000000","Armenia",130,1],["28.1783000","113.1117000","Changsha, China",131,1],["42.1149000","-102.8880000","Alliance, United States",131,1],["28.6519000","77.2315000","Delhi, India",132,1],["35.5144000","-97.5865000","Oklahoma City, United States",132,1],["30.0043000","-95.1747000","Humble, United States",132,1],["41.5497000","-72.6531000","Middletown, United States",132,1],["36.0390000","-78.8780000","Durham, United States",133,1],["41.9106000","-91.7142000","Cedar Rapids, United States",133,1],["52.0697000","4.3303000","The Hague, Netherlands",133,1],["-3.8125000","102.2875000","Bengkulu, Indonesia",134,1],["42.6074000","-87.8305000","Kenosha, United States",134,1],["35.8969000","139.6510000","Saitama, Japan",134,1],["23.3383000","116.0081000","Anqian, China",134,1],["33.6957000","73.0113000","Islamabad, Pakistan",135,1],["53.3472000","-6.2439000","Ireland",135,1],["22.8137000","108.3146000","Nanning, China",135,1],["39.1753000","-84.2944000","Milford, United States",135,1],["40.7243000","8.5588000","Sassari, Italy",137,1],["40.2973000","-74.3582000","Englishtown, United States",137,1],["-29.7167000","-52.4333000","Santa Cruz do Sul, Brazil",138,1],["38.4479000","141.2670000","Ishinomaki, Japan",138,1],["24.4638000","54.3630000","Abu Dhabi, United Arab Emirates",138,1],["46.7785000","6.6411000","Yverdon-les-Bains, Switzerland",139,1],["32.9444000","-97.3119000","Fort Worth, United States",139,1],["41.7025000","-86.2423000","Notre Dame, United States",139,1],["47.2573000","-122.4921000","Tacoma, United States",139,1],["-31.9471000","115.8647000","Perth, Australia",140,1],["23.0872000","113.0127000","Baishaqiao, China",140,1],["-21.9065000","-47.8747000","S\u00e3o Carlos, Brazil",141,1],["13.0878000","80.2785000","Chennai, India",141,1],["49.2167000","17.6667000","Zl\u00edn, Czech Republic",141,1],["40.7265000","-74.1782000","Newark, United States",141,1],["59.4339000","24.7281000","Tallinn, Estonia",141,1],["56.1567000","10.2108000","Aarhus, Denmark",142,1],["51.9664000","4.5427000","Rotterdam, Netherlands",143,1],["23.0760000","115.3378000","Chini, China",143,1],["22.8009000","113.2921000","Shunde, China",143,1],["40.7609000","-73.9115000","Queens, United States",144,1],["8.0000000","-2.0000000","Ghana",144,1],["43.7793000","11.2463000","Florence, Italy",144,1],["47.8435000","-122.1957000","Bothell, United States",144,1],["35.1903000","113.8015000","Nangandao, China",145,1],["1.3480000","103.7032000","Jurong West New Town, Singapore",146,1],["31.5000000","34.7500000","Israel",146,1],["51.9510000","7.6181000","M\u00fcnster, Germany",147,1],["41.3931000","-81.5365000","Bedford, United States",148,1],["19.0383000","109.8400000","Yinggen, China",148,1],["35.0000000","38.0000000","Syria",148,1],["22.3952000","114.2066000","Fo Tan, Hong Kong",151,1],["37.9532000","-121.3116000","Stockton, United States",151,1],["39.8499000","-86.2649000","Indianapolis, United States",151,1],["37.7692000","-3.7903000","Ja\u00e9n, Spain",152,1],["35.1131000","-106.5781000","Albuquerque, United States",152,1],["24.1659000","113.4127000","Yingcheng, China",152,1],["40.6236000","-111.9871000","West Jordan, United States",153,1],["58.9866000","-2.9645000","Orkney, United Kingdom",153,1],["35.2507000","-88.9998000","Bolivar, United States",154,1],["36.8065000","127.1522000","Cheonan, Republic of Korea",154,1],["41.8379000","-71.3932000","Providence, United States",154,1],["41.8919000","12.5113000","Rome, Italy",155,1],["42.2886000","-83.4641000","Canton, United States",155,1],["33.3860000","-82.0910000","Augusta, United States",155,1],["34.4366000","-119.8339000","Santa Barbara, United States",155,1],["44.0465000","12.6011000","Rimini, Italy",155,1],["41.0000000","75.0000000","Kyrgyzstan",156,1],["35.6778000","139.7082000","Shibuya, Japan",157,1],["22.2699000","112.8231000","Anbu, China",157,1],["40.2161000","116.2347000","Changping, China",157,1],["47.3333000","13.3333000","Austria",158,1],["35.7270000","51.3336000","Tehran, Iran",158,1],["40.6381000","22.9455000","Thessaloniki, Greece",159,1],["37.6313000","-122.0975000","Hayward, United States",159,1],["48.5167000","2.6500000","Dammarie-les-Lys, France",159,1],["53.6537000","-1.7208000","Huddersfield, United Kingdom",159,1],["34.2598000","108.9294000","Xi'an, China",160,1],["41.0000000","64.0000000","Uzbekistan",160,1],["38.8078000","-77.0523000","Alexandria, United States",160,1],["47.5000000","19.0833000","Budapest, Hungary",160,1],["48.6167000","8.1333000","Sasbachwalden, Germany",162,1],["41.6227000","-86.2452000","South Bend, United States",162,1],["57.0000000","25.0000000","Latvia",164,1],["35.5819000","139.7663000","Heiwajima, Japan",166,1],["1.2000000","104.0000000","Patam, Indonesia",166,1],["51.6744000","7.1343000","Marl, Germany",166,1],["38.4067000","27.1400000","Izmir, Turkey",166,1],["37.4788000","126.9523000","Gwanak-gu, Republic of Korea",167,1],["30.2948000","-91.8296000","Breaux Bridge, United States",169,1],["55.8119000","-4.2573000","Glasgow, United Kingdom",169,1],["52.9536000","-1.1505000","Nottingham, United Kingdom",170,1],["24.9328000","91.8739000","Sylhet, Bangladesh",170,1],["-22.9201000","-43.3307000","Rio de Janeiro, Brazil",171,1],["24.4798000","118.0819000","Xiamen, China",171,1],["43.0670000","-87.9682000","Milwaukee, United States",172,1],["28.6529000","-81.2106000","Oviedo, United States",173,1],["32.4740000","-94.7062000","Longview, United States",173,1],["22.9712000","112.4181000","Butang, China",174,1],["30.4581000","31.1760000","Banha, Egypt",174,1],["37.3197000","-76.7625000","Williamsburg, United States",174,1],["41.5053000","-81.5566000","Cleveland, United States",174,1],["47.6722000","-122.1257000","Redmond, United States",175,1],["42.8861000","-78.7457000","Buffalo, United States",177,1],["-6.5944000","106.7892000","Bogor, Indonesia",177,1],["37.0981000","-84.1167000","London, United States",179,1],["39.4833000","-0.4500000","Manises, Spain",179,1],["44.3456000","-88.4343000","Appleton, United States",180,1],["21.9426000","110.8085000","Guangtan, China",180,1],["14.1830000","121.1993000","Bagong Kalsada, Philippines",180,1],["50.1049000","8.6295000","Frankfurt am Main, Germany",181,1],["45.5377000","-122.6006000","Portland, United States",181,1],["33.8656000","-84.0725000","Lilburn, United States",183,1],["31.8639000","117.2808000","Hefei, China",183,1],["23.2955000","113.8246000","Licheng, China",184,1],["21.5168000","39.2192000","Jeddah, Saudi Arabia",184,1],["32.8791000","-96.9898000","Irving, United States",185,1],["42.6449000","-83.4036000","Waterford, United States",186,1],["-26.2309000","28.0583000","Johannesburg, South Africa",186,1],["34.8045000","135.7668000","Kyotanabe, Japan",186,1],["49.1378000","-122.8521000","Surrey, Canada",187,1],["22.0333000","112.5974000","Gaolong, China",187,1],["22.5731000","113.2874000","Yu'an, China",187,1],["35.6340000","-106.0850000","Santa Fe, United States",188,1],["17.3753000","78.4744000","Hyderabad, India",188,1],["26.1331000","-81.7938000","Naples, United States",188,1],["4.6492000","-74.0628000","Bogot\u00e1, Colombia",189,1],["38.9507000","-86.6139000","Springville, United States",191,1],["48.5534000","8.9722000","Ammerbuch, Germany",192,1],["54.6833000","25.3167000","Vilnius, Republic of Lithuania",193,1],["18.5196000","73.8554000","Pune, India",195,1],["-36.8506000","174.7679000","Auckland, New Zealand",196,1],["25.2925000","51.5321000","Doha, Qatar",196,1],["33.4306000","-111.9256000","Tempe, United States",200,1],["34.6174000","-86.5538000","Huntsville, United States",200,1],["22.1667000","111.7833000","Yangchun, China",201,1],["30.5154000","-97.6689000","Round Rock, United States",202,1],["35.1518000","-107.8575000","Grants, United States",202,1],["37.9895000","-121.8023000","Antioch, United States",205,1],["53.3331000","-6.2489000","Dublin, Ireland",205,1],["-28.3548000","-59.2506000","Las Toscas, Argentina",208,1],["21.3195000","-157.8525000","Honolulu, United States",208,1],["23.2547000","77.4029000","Bhopal, India",209,1],["55.9489000","-3.1632000","Edinburgh, United Kingdom",209,1],["40.9573000","-72.9076000","Shoreham, United States",209,1],["54.3600000","16.6861000","S\u0142awno, Poland",210,1],["-15.7792000","-47.9341000","Bras\u00edlia, Brazil",211,1],["52.1828000","20.9846000","Warsaw, Poland",211,1],["-34.6033000","-58.3816000","Buenos Aires, Argentina",213,1],["42.9469000","-85.6206000","Grand Rapids, United States",214,1],["50.9157000","-113.8920000","Calgary, Canada",216,1],["23.6239000","115.5033000","Huadong, China",217,1],["23.0276000","113.0420000","Dafu, China",218,1],["42.4406000","-76.4966000","Ithaca, United States",219,1],["21.9392000","110.8461000","Gaozhou, China",222,1],["33.1479000","72.5500000","Unknown Location",222,1],["-12.0464000","-77.0428000","Lima, Peru",223,1],["35.6931000","139.7137000","Shinjuku, Japan",223,1],["22.1866000","112.3042000","Encheng, China",224,1],["45.0001000","-93.0986000","Saint Paul, United States",224,1],["26.2410000","50.5779000","Manama, Bahrain",225,1],["59.3333000","18.0500000","Stockholm, Sweden",225,1],["34.2679000","-118.3399000","Sunland, United States",225,1],["40.7424000","-74.0325000","Hoboken, United States",227,1],["15.1533000","120.5893000","Angeles City, Philippines",228,1],["59.9050000","10.7487000","Oslo, Norway",229,1],["40.8831000","-85.4975000","Huntington, United States",231,1],["50.4333000","30.5167000","Kiev, Ukraine",232,1],["37.7269000","112.4708000","Taiyuan, China",233,1],["30.4170000","-84.1850000","Tallahassee, United States",234,1],["42.0577000","-80.0434000","Erie, United States",234,1],["33.7866000","-118.2987000","Pasadena, United States",234,1],["34.6866000","135.4355000","Osaka, Japan",234,1],["22.8533000","113.6572000","Xibian, China",235,1],["23.7000000","113.0333000","Qingyuan, China",236,1],["-37.8159000","144.9669000","Melbourne, Australia",237,1],["38.2590000","-85.6609000","Louisville, United States",237,1],["23.3817000","116.4800000","Beitou, China",238,1],["8.0000000","38.0000000","Ethiopia",238,1],["32.0678000","34.7647000","Tel Aviv, Israel",241,1],["41.6874000","-86.1705000","Mishawaka, United States",242,1],["22.7695000","111.5688000","Luocheng, China",242,1],["36.1021000","-97.0636000","Stillwater, United States",243,1],["53.1418000","10.1417000","Soderstorf, Germany",243,1],["20.2333000","85.8333000","Bhubaneswar, India",243,1],["45.4402000","-73.6747000","Lachine, Canada",245,1],["50.0833000","14.4667000","Prague, Czech Republic",245,1],["-41.0000000","174.0000000","New Zealand",245,1],["23.0312000","113.0697000","Dajiang, China",246,1],["48.4942000","9.1666000","Reutlingen, Germany",247,1],["22.3000000","114.1667000","Tsimshatsui, Hong Kong",248,1],["42.7370000","-84.4839000","East Lansing, United States",248,1],["48.5670000","39.3171000","Luhansk, Ukraine",248,1],["22.3833000","114.1833000","Shatin, Hong Kong",249,1],["21.8554000","110.2094000","Baxia, China",249,1],["45.4573000","-122.7992000","Beaverton, United States",251,1],["37.5155000","-121.8962000","Fremont, United States",251,1],["36.0864000","-80.2636000","Winston-Salem, United States",252,1],["25.6955000","32.6536000","Luxor, Egypt",252,1],["-30.0000000","-71.0000000","Chile",253,1],["30.3415000","-81.7358000","Jacksonville, United States",254,1],["48.1500000","11.5833000","Munich, Germany",255,1],["30.2940000","120.1619000","Hangzhou, China",255,1],["29.4553000","-98.5677000","San Antonio, United States",256,1],["13.7500000","100.5167000","Bangkok, Thailand",257,1],["40.8343000","-73.9235000","The Bronx, United States",257,1],["36.0877000","-94.3093000","Fayetteville, United States",259,1],["44.5646000","-123.2620000","Corvallis, United States",260,1],["23.0984000","114.0901000","Bailianhu, China",261,1],["35.2523000","-97.4603000","Norman, United States",264,1],["42.6833000","23.3167000","Sofia, Bulgaria",266,1],["55.7700000","-4.0535000","Hamilton, United Kingdom",267,1],["-29.0000000","24.0000000","South Africa",267,1],["59.6162000","16.5528000","V\u00e4ster\u00e5s, Sweden",267,1],["43.0801000","-77.6342000","Rochester, United States",268,1],["34.9507000","-82.0868000","Wellford, United States",269,1],["50.8509000","4.3447000","Belgium",270,1],["35.0214000","135.7556000","Kyoto, Japan",274,1],["45.9968000","24.9970000","Romania",276,1],["-23.4120000","-46.4435000","Guarulhos, Brazil",277,1],["39.1215000","-86.5784000","Bloomington, United States",280,1],["28.5807000","-81.1893000","Orlando, United States",281,1],["59.9500000","10.7500000","Norway",281,1],["33.4063000","-112.0262000","Phoenix, United States",285,1],["22.3000000","114.1833000","Hung Hom, Hong Kong",286,1],["-33.4500000","-70.6667000","Santiago, Chile",286,1],["37.4404000","-121.8705000","Milpitas, United States",291,1],["53.3000000","141.4667000","Chkalov, Russia",295,1],["-22.9172000","-43.0839000","Niter\u00f3i, Brazil",295,1],["26.2154000","-80.2710000","Fort Lauderdale, United States",296,1],["23.7018000","90.3742000","Bangladesh",297,1],["49.2023000","18.8707000","Varin, Slovak Republic",297,1],["22.1667000","114.2500000","Wanchai, Hong Kong",297,1],["38.9208000","-77.0360000","Washington, United States",300,1],["10.0000000","8.0000000","Nigeria",301,1],["47.6176000","-122.1424000","Bellevue, United States",302,1],["23.0536000","116.2701000","Baishahu, China",302,1],["31.2162000","29.9529000","Alexandria, Egypt",306,1],["38.9940000","-76.9519000","College Park, United States",306,1],["30.5856000","114.2665000","Wuhan, China",308,1],["35.0614000","-85.2478000","Chattanooga, United States",309,1],["35.2426000","-80.7410000","Charlotte, United States",309,1],["43.0731000","-89.4012000","Madison, United States",312,1],["43.0391000","-76.1277000","Syracuse, United States",315,1],["40.5511000","-74.4606000","Piscataway, United States",316,1],["12.9833000","77.5833000","Bangalore, India",318,1],["37.9833000","23.7333000","Athens, Greece",320,1],["42.3649000","-71.0987000","Cambridge, United States",320,1],["39.9046000","-82.9703000","Columbus, United States",321,1],["36.1085000","-86.7738000","Nashville, United States",323,1],["43.2565000","76.9285000","Almaty, Kazakhstan",324,1],["23.3680000","112.6857000","Sihui, China",325,1],["23.0243000","112.4455000","Gaoyao, China",325,1],["41.0019000","28.9645000","Istanbul, Turkey",326,1],["47.3667000","8.5500000","Zurich, Switzerland",329,1],["60.4907000","22.1453000","Raisio, Finland",329,1],["45.7500000","126.6500000","Harbin, China",332,1],["60.1833000","24.8296000","Espoo, Finland",332,1],["51.7158000","-1.2925000","Oxford, United Kingdom",336,1],["41.8318000","-73.2251000","Goshen, United States",337,1],["30.6521000","-96.3410000","College Station, United States",341,1],["21.6333000","110.5833000","Huazhou, China",343,1],["38.6784000","-90.3770000","St Louis, United States",344,1],["44.8330000","-91.5125000","Eau Claire, United States",345,1],["36.2973000","-115.2418000","Las Vegas, United States",352,1],["25.2633000","55.3087000","Dubai, United Arab Emirates",352,1],["39.9117000","32.8403000","Ankara, Turkey",352,1],["33.0151000","-96.5389000","Wylie, United States",353,1],["45.0123000","-93.3447000","Minneapolis, United States",354,1],["35.9375000","-84.0730000","Knoxville, United States",354,1],["60.1708000","24.9375000","Finland",355,1],["52.3806000","4.8738000","Amsterdam, Netherlands",373,1],["51.3581000","0.1277000","Orpington, United Kingdom",373,1],["40.4165000","-3.7026000","Madrid, Spain",373,1],["35.4643000","139.6262000","Yokohama, Japan",377,1],["28.6327000","77.2198000","New Delhi, India",377,1],["33.8782000","-117.9567000","Fullerton, United States",382,1],["32.7908000","-96.8336000","Dallas, United States",385,1],["40.1106000","-88.2073000","Urbana, United States",386,1],["40.5183000","-74.3969000","Edison, United States",388,1],["32.0617000","118.7778000","Nanjing, China",390,1],["51.3403000","12.3198000","Leipzig, Germany",392,1],["48.5132000","32.2597000","Kirovohrad, Ukraine",397,1],["-33.8615000","151.2055000","Sydney, Australia",402,1],["55.7327000","12.3656000","Copenhagen, Denmark",403,1],["37.9667000","23.7167000","Greece",408,1],["40.4763000","-86.9571000","West Lafayette, United States",410,1],["42.3364000","-71.0326000","Boston, United States",417,1],["19.4342000","-99.1386000","Mexico City, Mexico",417,1],["30.6966000","-88.1737000","Mobile, United States",423,1],["25.0000000","45.0000000","Saudi Arabia",424,1],["43.8800000","125.3228000","Changchun, China",427,1],["-34.0000000","-64.0000000","Argentina",428,1],["4.5981000","-74.0799000","Colombia",428,1],["22.9283000","112.0395000","Yunfu, China",430,1],["42.6960000","23.3320000","Bulgaria",430,1],["22.3500000","114.1333000","Kwai Chung, Hong Kong",431,1],["23.7460000","90.3820000","Dhaka, Bangladesh",432,1],["31.3041000","120.5954000","Suzhou, China",434,1],["45.6433000","13.7903000","Trieste, Italy",440,1],["34.6805000","-82.8231000","Clemson, United States",441,1],["38.9311000","-77.3489000","Reston, United States",442,1],["37.3931000","-121.9620000","Santa Clara, United States",443,1],["35.8536000","-78.6262000","Raleigh, United States",443,1],["53.4809000","-2.2374000","Manchester, United Kingdom",452,1],["47.4925000","19.0514000","Hungary",456,1],["39.7525000","-104.9995000","Denver, United States",464,1],["48.6667000","19.5000000","Slovak Republic",464,1],["47.2637000","11.4016000","Innsbruck, Austria",466,1],["38.9618000","-77.1193000","Bethesda, United States",467,1],["29.7748000","-82.3846000","Gainesville, United States",477,1],["53.2334000","6.5108000","Groningen, Netherlands",480,1],["55.7123000","12.0564000","Denmark",481,1],["10.8142000","106.6438000","Ho Chi Minh City, Vietnam",482,1],["38.4689000","-121.3440000","Sacramento, United States",483,1],["42.6847000","-73.7354000","Albany, United States",484,1],["52.5167000","13.4000000","Berlin, Germany",484,1],["16.0000000","106.0000000","Vietnam",486,1],["24.1483000","115.7227000","Xingcheng, China",487,1],["22.8791000","113.2658000","Dazhou, China",493,1],["51.0563000","5.2777000","Koersel, Belgium",495,1],["35.7092000","139.3574000","Akishima, Japan",496,1],["34.4265000","-119.8631000","Goleta, United States",500,1],["45.5403000","-73.5955000","Montreal, Canada",502,1],["39.6675000","20.8508000","Ioannina, Greece",502,1],["34.0553000","-117.7523000","Pomona, United States",505,1],["49.2461000","7.0022000","Saarbr\u00fccken, Germany",508,1],["31.4137000","73.0805000","Faisalabad, Pakistan",512,1],["23.0000000","-102.0000000","Mexico",518,1],["40.7252000","-73.9440000","Brooklyn, United States",524,1],["43.7806000","-79.3503000","Toronto, Canada",524,1],["39.4764000","-79.2402000","Swanton, United States",525,1],["48.8534000","2.3488000","Paris, France",525,1],["52.4954000","-1.7846000","Birmingham, United Kingdom",527,1],["36.7339000","-3.6907000","Almu\u00f1\u00e9car, Spain",531,1],["30.6667000","104.0667000","Chengdu, China",532,1],["22.3812000","112.6849000","Changsha, China",533,1],["31.4888000","74.3686000","Lahore, Pakistan",540,1],["24.1469000","120.6839000","Taichung, Taiwan",544,1],["24.0000000","54.0000000","United Arab Emirates",546,1],["41.3186000","-72.9302000","New Haven, United States",549,1],["22.0139000","112.9816000","Futian, China",549,1],["-23.6270000","-46.6350000","S\u00e3o Paulo, Brazil",561,1],["37.7409000","-0.8511000","Los Alcazares, Spain",571,1],["35.6980000","51.4115000","Iran",572,1],["41.3472000","-75.9854000","Dallas, United States",572,1],["22.3730000","110.9475000","Xinyi, China",572,1],["48.0000000","68.0000000","Kazakhstan",574,1],["46.2022000","6.1457000","Geneva, Switzerland",582,1],["22.3667000","114.1000000","Tsuen Wan, Hong Kong",589,1],["50.0848000","14.4112000","Czech Republic",590,1],["40.7662000","-74.0178000","Weehawken, United States",590,1],["30.4042000","-91.1431000","Baton Rouge, United States",599,1],["20.8634000","110.0181000","Shanweicun, China",601,1],["37.4365000","-77.4807000","Richmond, United States",618,1],["21.0313000","105.8516000","Hanoi, Vietnam",626,1],["60.2090000","24.9726000","Helsinki, Finland",627,1],["42.4248000","-83.1951000","Detroit, United States",627,1],["40.7957000","-77.8618000","State College, United States",631,1],["41.3888000","2.1590000","Barcelona, Spain",636,1],["51.5164000","-0.0930000","London, United Kingdom",653,1],["22.8224000","114.4950000","Beijiao, China",655,1],["49.2958000","-123.1410000","Vancouver, Canada",657,1],["47.1057000","37.5331000","Mariupol, Ukraine",672,1],["59.8944000","30.2642000","Saint Petersburg, Russia",678,1],["32.7153000","-117.1573000","San Diego, United States",689,1],["-6.1741000","106.8296000","Jakarta, Indonesia",690,1],["25.0766000","114.2657000","Beijing, China",691,1],["41.7806000","123.4312000","Shenyang, China",704,1],["39.9597000","-75.1968000","Philadelphia, United States",706,1],["52.4391000","-1.5039000","Coventry, United Kingdom",712,1],["28.0000000","84.0000000","Nepal",739,1],["39.0000000","35.0000000","Turkey",776,1],["37.9876000","-78.6086000","Charlottesville, United States",783,1],["23.5939000","116.1289000","Heshan, China",786,1],["35.6850000","139.7514000","Tokyo, Japan",798,1],["23.7333000","114.6833000","Heyuan, China",802,1],["28.0109000","-82.4948000","Tampa, United States",808,1],["54.9449000","-1.3725000","Sunderland, United Kingdom",820,1],["45.4667000","9.2000000","Milan, Italy",821,1],["42.3068000","-83.7059000","Ann Arbor, United States",822,1],["37.8084000","-122.2846000","Oakland, United States",837,1],["33.6403000","-117.7694000","Irvine, United States",846,1],["41.8483000","-87.6517000","Chicago, United States",854,1],["37.0313000","-122.1198000","Santa Cruz, United States",873,1],["33.7485000","-84.3871000","Atlanta, United States",880,1],["22.8680000","113.4831000","Qingcheng, China",889,1],["38.9592000","-94.5961000","Kansas City, United States",892,1],["55.7522000","37.6156000","Moscow, Russia",919,1],["52.0000000","20.0000000","Poland",948,1],["38.7680000","-121.3349000","Roseville, United States",998,1],["41.6412000","-111.8966000","Logan, United States",1000,1],["50.7054000","7.0719000","Bonn, Germany",1022,1],["22.8836000","114.7758000","Baiyun, China",1031,1],["49.2500000","-122.9500000","Burnaby, Canada",1044,1],["37.7595000","-122.4367000","San Francisco, United States",1047,1],["23.5669000","113.7772000","Reshui, China",1084,1],["23.1861000","116.0483000","Xinzhai, China",1096,1],["25.0478000","121.5318000","Taipei, Taiwan",1106,1],["37.3897000","-122.0832000","Mountain View, United States",1137,1],["26.4554000","-80.0755000","Delray Beach, United States",1216,1],["23.5000000","121.0000000","Taiwan",1264,1],["19.0748000","72.8856000","Mumbai, India",1267,1],["30.0500000","31.3666000","Egypt",1268,1],["40.0000000","-4.0000000","Spain",1301,1],["40.4442000","-79.9557000","Pittsburgh, United States",1305,1],["25.7634000","-80.1886000","Miami, United States",1308,1],["57.0480000","9.9187000","Aalborg, Denmark",1315,1],["41.2619000","-95.8608000","Council Bluffs, United States",1335,1],["29.8834000","-95.4553000","Houston, United States",1336,1],["52.3824000","4.8995000","Netherlands",1336,1],["37.4230000","-122.1639000","Stanford, United States",1352,1],["42.8333000","12.8333000","Italy",1375,1],["55.7386000","37.6068000","Russia",1380,1],["22.3167000","114.1833000","Kowloon, Hong Kong",1435,1],["37.4712000","-5.6461000","Seville, Spain",1450,1],["-5.0000000","120.0000000","Indonesia",1451,1],["40.7406000","-111.8230000","Salt Lake City, United States",1464,1],["36.6667000","137.2667000","Toyama-shi, Japan",1571,1],["14.5833000","120.9667000","Philippines",1599,1],["33.9332000","-83.3536000","Athens, United States",1690,1],["22.2795000","114.1460000","Central, Hong Kong",1791,1],["37.2125000","-121.8641000","San Jose, United States",1835,1],["21.8556000","111.9627000","Yangjiang, China",1867,1],["40.7126000","-74.0066000","New York, United States",1955,1],["22.2513000","112.7786000","Taishan, China",1964,1],["23.3083000","116.3381000","Meizhou, China",2025,1],["21.2815000","110.3427000","Zhanjiang, China",2207,1],["35.6900000","139.6900000","Japan",2289,1],["37.5985000","126.9783000","Seoul, Republic of Korea",2352,1],["-27.3833000","-55.8833000","Posadas, Argentina",2378,1],["30.0000000","70.0000000","Pakistan",2492,1],["37.5112000","126.9741000","Republic of Korea",2513,1],["24.9056000","67.0822000","Karachi, Pakistan",2522,1],["21.6500000","110.9000000","Maoming, China",2636,1],["23.1728000","112.8335000","Sanshui, China",2670,1],["59.3247000","18.0560000","Sweden",2689,1],["50.4500000","30.5233000","Ukraine",2711,1],["-33.4940000","143.2104000","Australia",2723,1],["23.6651000","116.6379000","Chaozhou, China",2749,1],["47.6606000","-122.2919000","Seattle, United States",2947,1],["23.4522000","116.0922000","Shantou, China",3042,1],["1.3667000","103.8000000","Singapore",3370,1],["39.0481000","-77.4728000","Ashburn, United States",3372,1],["31.0449000","121.4012000","Shanghai, China",3483,1],["22.2833000","114.1500000","Central District, Hong Kong",3487,1],["34.0544000","-118.2440000","Los Angeles, United States",3574,1],["47.1449000","8.1551000","Switzerland",3624,1],["20.0000000","77.0000000","India",3798,1],["23.5289000","116.3642000","Jieyang, China",3893,1],["30.2961000","-97.7369000","Austin, United States",3969,1],["30.0778000","31.2852000","Cairo, Egypt",4043,1],["46.0000000","2.0000000","France",4099,1],["39.9288000","116.3889000","Beijing, China",4380,1],["24.7974000","113.5853000","Shaoguan, China",4391,1],["-10.0000000","-55.0000000","Brazil",4444,1],["22.2500000","114.1667000","Hong Kong",4684,1],["23.0501000","112.4570000","Zhaoqing, China",4703,1],["60.0000000","-95.0000000","Canada",5125,1],["22.5833000","113.0833000","Jiangmen, China",5647,1],["47.0000000","8.0000000","Unknown Location",5973,1],["51.4964000","-0.1224000","United Kingdom",6262,1],["1.2931000","103.8558000","Singapore, Singapore",6568,1],[-48,28,"Unknown Location",6777,1],["49.5961000","-119.6746000","Summerland, Canada",7164,1],["51.0000000","9.0000000","Germany",7797,1],["23.0833000","114.4000000","Huizhou, China",7916,1],["23.0202000","113.1282000","Chancheng, China",9222,1],["23.0333000","113.7167000","Dongguan, China",10682,1],["22.5333000","114.1333000","Shenzhen, China",11247,1],["22.2793000","113.5683000","Zhuhai, China",11318,1],["23.0287000","113.1341000","Foshan, China",15313,1],["21.3199000","110.5723000","Zhongshan, China",16823,1],["23.1167000","113.2500000","Guangzhou, China",102049,1],["37.7510000","-97.8220000","United States",156422,1],["35.0000000","105.0000000","China",812384,6]];
    var max_visit_count = 812384;

    var number = 0;
    var markers = {};

    var sys_icons = {"Win10":["icon_win10","Windows 10"],"Win8.1":["icon_win81","Windows 8.1"],"Win32":["icon_win32","Win32"],"WinVista":["icon_win_vista","Windows Vista"],"Linux":["icon_linux","Linux"],"Android":["icon_android_os","Android"],"Android WebView":["icon_android_webview"],"MacOSX":["icon_osx","Mac OS X"],"Chrome":["icon_chrome"],"Chromium":["icon_chromium"],"Edge":["icon_edge"],"Opera":["icon_opera"],"Win7":["icon_win7","Windows 7"],"Firefox":["icon_firefox"],"Safari":["icon_safari"],"Mobile Safari UIWebView":["icon_safari"],"iOS":["icon_ios","iOS"],"IE":["icon_ie"]};
    var initialPoints = addressPoints.length;

    var dynamic_multiplex = 6;
    var x = Math.ceil ( initialPoints / 30 );

    x = x > 4 ? 4 : x;

    if ( initialPoints > 10 ) {
        dynamic_multiplex = 6 - x;
    }

    function updateCounts(count) {
        if (!live_orange_dots) {
            return;
        }
        //var count = 1;
        var one_up_container = $('.non_unique_visitor_count-oneup');
        var num_element = $('.non_unique_visitor_count-count');
        $(".badge.plus").remove();
        $('<span class="badge plus" style="margin: 0px 4px 0px 0px; vertical-align: middle;">+' + count + '</span>').data('count', count)
            .prependTo(one_up_container).fadeOut(3500, function () {
            $(this).remove();
        });
        var total_count = (parseInt(num_element.data('count')) + count);
        num_element.html(total_count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
            .data('count', total_count);
    }

    function updateTheValue(element, count) {
        var _count = element.data('value') + count;

        element.data('value', _count) ;
        element.html ( _count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") );
    }

    function setTheValue(element, count) {
        element.data('value', parseInt(count)) ;
        element.html ( count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") );
    }

    function updateSummaryTable(summary, count ) {

        if ( count ) {
            updateTheValue ( $(".today-pageviews"), count );
            updateTheValue ( $(".total-pageviews"), count );
        }

        initPopover(summary);
    }

    function animationFrame() {

        var nums = 0, rad, p = 0;

        for (var loc in markers) {
            var d = markers[loc];
            ++p;
            rad = d.marker.getRadius();
            if (rad > d.to) {
                rad--;
                d.marker.setRadius(rad);
                if (rad > d.to) {
                    ++nums;
                }
            }
        }

        if (nums > 0) {
            setTimeout(animationFrame, 50);
        }
    }

    function startAnimation() {
        setTimeout(animationFrame, 30);
    }

    function addMarker(a, n, live) {
        var marker;

        if (arguments.length < 2) {
            n = false;
        }

        if ( arguments.length < 3 ) {
            live = false;
        }


        var gid = a[5] ? a[5] : false;
        var cnt = a[3];

        if (!a[0] || !a[1] ) {
            return;
        }

        if (gid && (gid in markers)) {
            markers[gid].data[3] += cnt;
            cnt = markers[gid].data[3];
        }

        var s = cnt > 1 ? "s" : "";

        if ( a[2] == null || a[2] == 'null') {

        }

        if ( n && a[4] >= 5 ) {

        }


        var title = cnt + (gid ? ' recent' : '') + ' visitor' + s + ' from ' + a[2];

        var markerSize = {
            1: 3, 2: 5, 3: 8, 4: 10, 5: 12, 6: 14
        };

        var markerSizeNew = {
            1: 4, 2: 6, 3: 9, 4: 11, 5: 13, 6: 14
        };

        //--- 90 : 3, 60 : 4, 30 : 5, 10 : 6

        var radius = 0;
        var multiplex = live ? 8 : dynamic_multiplex;

        if (gid && (gid in markers)) {
            //--- 
            var pd = markers[gid].data;
            var r = pd[4];

            radius = !n ? markerSize[r] : markerSizeNew[r];

            markers[gid].marker.setRadius(radius * multiplex);
            markers[gid].to = radius;

            markers[gid].marker.bindTooltip(title);

        } else {

            var r = a[4];
            radius = !n ? markerSize[r] : markerSizeNew[r];

            marker = L.circleMarker([a[0], a[1]], {
                radius: !n ? radius : radius * multiplex,
                fillColor: !n ? "#FF0000" : "#F8A400",
                fillOpacity: !n ? .7 : 1,
                weight: .5,
                color: "#ffffff"
                , className: "mn"
            }).bindTooltip(title).addTo(map);

            if (gid) {
                markers[gid] = {'marker': marker, 'to': radius, 'data': a};
            }
        }
    }

    function addMarkerAndRow(a, text) {
        ++number;
        addMarker(a, text, true);


        var date = a[6].replace(/-/g, "/");
        var cty = a[7];
        var iso_code = a[8];
        var country = a[9];

        var $head = $('#recent-visits');
        var $tr = $head.find('tr')[0];

        var flagcode = (iso_code ? iso_code.toLowerCase() : "");
        var flg = '<span class="flag16 f16' + flagcode + '" style="margin-right: 5px;" title="' + country + '"></span>';

        var date = new Date(date);
        var dd = new Date(date.getTime() - (date.getTimezoneOffset() * 60000));

        var $cr = $('<tr class="newtr"><td  data-lat="' + a[0] + '" data-lng="' + a[1] + ' " style="cursor: pointer;"> ' + flg + ' <strong>' + cty + '</strong> ' +
            '<time class="timeago" datetime="' + dd.toISOString() + '">' + date + '</time></td></tr>');

        $cr.insertBefore($tr);
        $("time.timeago").timeago();

        var count = $head.find('tr').length;

        if (count > row_count_in_table) {
            $head.find('tr:last').remove();
        }

    }

    for (var i = 0; i < addressPoints.length; i++) {
        var a = addressPoints[i];
        addMarker(a);
    }

    function updateLastDates(activeUser) {

        if (activeUser != null) {
            var user = activeUser;

            var date = user[6].replace(/-/g, "/");
            var cty = user[7];
            var iso_code = user[8];

            var name = user[2];
            var flagcode = (iso_code ? iso_code.toLowerCase() : "");
            var flg = '<span class="flag16 f16' + flagcode + '"></span> ';


            var date = new Date(date);
            var dd = new Date(date.getTime() - (date.getTimezoneOffset() * 60000));
            $(".last-active-user").html(flg + name + '<time class="timeago text-nowrap" style="margin-left:5px;" datetime="' + dd.toISOString() + '">' + date + '</time>');
            $(".active-user").addClass("countedlive");
            $("time.timeago").timeago();

            setTimeout(function () {
                $(".active-user").removeClass("countedlive");
            }, 1100);

        }

        var d = new Date();
        $(".last-update").html ( transformDate(d, true) );
        
        setTimeout(function () {
            $(".active-user").removeClass("countedlive");
            $(".last-update").removeClass("countedlive");
        }, 1100);
    }


    function addVisitsDetails(table, hits ) {
        var urlText = '';
        var url  = '';

        for ( var _i = hits.length - 1; _i >= 0; _i-- ) {
            var $tr = $("<tr>");

            var localDate = transformDate(new Date(hits[_i].timestamp*1000));

            $tr.append($("<td>").html("<span class='text-nowrap' style='margin-right: 20px;'>Visited on " + localDate + "</span>"));

            if ( 'url' in hits[_i] ) {
                url = hits[_i].url;
                urlText = backlink_advanced ? '<a href="' + url + '" target="_blank">' + url + '</a>' : url;
                $tr.append($("<td>").html(urlText));
            }

            $tr.prependTo(table);
        }
    }

    function addRecentTableRow(row) {
        var sid = row['session_id'];
        var $main = $( "#" + sid + "_main");
        var exists = $main.length > 0;
        var $mt = $("table.table-st >tbody");

        if ( sid in history ) {
            for ( var _x = row['hits'].length - 1; _x >=0 ; _x-- ) {
                history[sid].unshift ( row['hits'][_x]);
            }
        } else {
            history[sid] = row['hits'];
        }

        if ( exists ) {
            var $ext = $( "#" + sid);
            var hits = row['hits'];
            var $t = $ext.find ( "tbody");

            addVisitsDetails($t, hits );

            var vc = $t.find("tr").length;

            $main.find("span.cntP").html(vc + ' pageview' + ( vc > 1 ? 's' : ''));
            $main.find("span.newV").remove();

            if ( !('ip' in row) ) {
                $main.find("td:last").html(row['hits'][0]['date']);
            }

            $main.addClass('newtr' );

            $ext.prependTo($mt);
            $main.prependTo($mt);
        } else {
            //--- create a tr pairs ---
            var $htr = $("<tr>").addClass('newtr');
            var count = row['hits'].length;
            $htr.attr ('id', sid + "_main");

            var $htd = $("<td>");
            var theData = null;

            if ('latitude' in row ) {
                theData = {'lat': row['latitude'], 'lng': row['longitude'], 'ip': row['ip'], 'ipd': row['ipd'],'location' : ( row['city_name'] ? row['city_name'] + ", " : "" ) +row['country_name'] };
            }

            var iso_code = row['country_iso_code'] ? row['country_iso_code'] : '';
            var visitFrom;

            if ( row['country_name'] ) {
                visitFrom = ( row["city_name"] ? row["city_name"] + ", " : "" ) + row['country_name'];
            } else {
                visitFrom = 'Unknown Location';
            }

            $htd.html ( "<span class='flag " + iso_code.toLowerCase()+ "' style='margin-right: 10px; float: left'></span>" +
                        "<span class='vstor'><span class='newV'>New</span> Visitor from " +
                       ( "latitude" in row  ? '<a href="#" style="border-bottom: 1px dotted #ccc; text-decoration: none;" title="Location on the Map" ' +
                                              'data-toggle="modal" data-target="#geopos">' +
                                              '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>' : '' ) +
                       (  visitFrom ) +
                       ( "latitude" in row  ? "</a>" : "" ) +
                         ' with <a role="button" data-toggle="collapse" href="#' + row['session_id']  + '"' +
                         'aria-expanded="false" aria-controls="' + row['session_id'] + '"><span ' +
                         'class="cntP">' + count + ' pageview' + ( count > 1 ? 's' : '') +'</span></a></span>'
                      );

            if ( theData != null ) {
                $htd.find("a").data(theData);
            }

            $htr.append ( $htd );

            var browser = row['browser']['browser'];
            var platform = row['browser']['platform'];

            $htd = $('<td>').addClass('text-nowrap');

            if( (browser !== undefined ) && (browser !== "undefined") && (browser !== "Default Browser")) {
                $htd.html(( browser in sys_icons ? '<span class="icon_os ' + sys_icons[browser][0] +
                    '"  title="' + browser + ' ' + row['browser']['version'] + '"></span>' : '' ) + browser);

            }

            $htr.append($htd);

            $htd = $('<td>').addClass('text-nowrap');

            if( (platform !== undefined ) && ( platform !== "unknown" ) ) {
                $htd.html(( platform in sys_icons ? '<span  class="icon_os ' + sys_icons[platform][0] +
                    '" title="' + sys_icons[platform][1] + '"></span>' : '' ) + platform);
            }

            $htr.append($htd);

            $htd = $('<td>').addClass('text-nowrap');
            if ( 'ip' in row ) {
                $htd.html('<a href="#" class="mdlLink" title="Location on the Map" data-toggle="modal" ' +
                          'data-target="#geopos">' + row['ip'] + '</a>');
                $htd.find('a').data(theData);
            } else {
                $htd.html ( row['hits'][0]['date'] );
            }

            $htr.append($htd);

            
            var $htr2 = $("<tr>").attr('id', row['session_id']).addClass('collapse');
            $htd = $('<td colspan="4" style="border-top: 0px;">');
            $htd.html ( '<div style="margin-left: 30px;"><table><thead>' +
                        '<tr><th>Time</th>' +
                        ('latitude' in row  ? '<th>Page Visited</th>' : '') +
                        '</tr></thead><tbody></tbody></table></div>');

            $htr2.append ( $htd );

            $htr2.prependTo($mt);
            $htr.prependTo($mt);

            var $t = $htr2.find('tbody');
            addVisitsDetails($t, history[sid] );
        }


        if ( $("table.table-st >tbody >tr").length > 2*recent_visits_count ) {
            $("table.table-st >tbody >tr:last").remove();
            $("table.table-st >tbody >tr:last").remove();
        }


    }

    function addRecentTableRows ( rows ) {
        for ( var i =  rows.length - 1; i >= 0 ; i-- ) {
            addRecentTableRow(rows[i]  );
        }
    }


    function liveHits() {

        if ( 'pausedUpdates' in window  ) {
            if ( window.pausedUpdates ) {
                return;
            }
        }

        $.get(
            '/ajax/live_hits',

            {
                'id': '85',
                'last_hit_id': last_hit_id,
                'max_hit_id': last_hit_id
            },

            function (data) {

                var activeUser = null;

                if (data.last_hit_id) {
                    last_hit_id = data.last_hit_id;
                }

                if ((data.hits != null) && (data.hits.length > 0)) {
                    //increaseCounter(data.hits.length);

                    for (var _i = data.hits.length - 1; _i >= 0; _i--) {
                        if (live_orange_dots) {
                            addMarkerAndRow(data.hits[_i], 'AJAX');
                        }
                        activeUser = data.hits[_i];
                        liveStats(activeUser[6].replace(/-/g, "/"));
                    }

                    updateCounts(data.hits.length);
                    updateSummaryTable(data.visit_table, data.hits.length);
                    startAnimation();
                } else {
                    updateSummaryTable(data.visit_table, 0);
                }

                                if ( (data.extended != null ) && (data.extended.length > 0 ) ) {
                    addRecentTableRows(data.extended);
                }
                
                updateLiveStats();
                updateLastDates(activeUser);
            },
            'json');
    }

        setTimeout(function () {
        $.get(
            '/ajax/orange_dots',
            {
                'id': '85',
                'last_hit_id': last_hit_id,
                'max_hit_id': last_hit_id,
                'max_visit_count': max_visit_count
            },

            function (data) {

                if (data.last_hit_id) {
                    last_hit_id = data.last_hit_id;
                }

                if ((data.hits != null) && (data.hits.length > 0)) {
                    //increaseCounter(data.hits.length);
                    for (var _i = data.hits.length - 1; _i >= 0; _i--) {
                        addMarker(data.hits[_i], 'new');
                    }

                    updateCounts(data.visits_count);

                    setTheValue ( $(".today-pageviews"), data.today_hits );
                    setTheValue ( $(".total-pageviews"), data.total_hits );

                    if ( 'visits_table' in data ) {
                        initPopover(data.visits_table);
                    }

                    startAnimation();

                }

                setInterval(liveHits, 5000);
            },
            'json');
    }, 1500);
    </script>

<script>

    $(document).ready(function () {

        //var start = moment().startOf('month');
        //var end = moment().endOf('month');


        var start = "01/01/2026";
        var end = "01/31/2026";


        var options = {
            "opens": 'left',
            startDate: start,
            endDate: end,
            minDate: "08/30/15",
            //maxDate: moment(),
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(7, 'days'), moment().subtract(1, 'days')],
                'Last 30 Days': [moment().subtract(30, 'days'), moment().subtract(1, 'days')],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                'This Year': [moment().startOf('year'), moment().endOf('year')]
            },
            "alwaysShowCalendars": true,
            "autoUpdateInput": false
        };

        $('#dp1,#dp3').daterangepicker(options, function (start, end, label) {

            var rng = (label != "Custom Range") ? label : start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD');
            $(".dp").attr("value", rng);

            docCookies.setItem('daterange', 'custom' + '|' + start.format('YYYY-MM-DD') + '|' + end.format('YYYY-MM-DD'), Infinity, '/');
            window.location.reload();
            return false;
        });

        options.applyClass = "btn-success downl";

        $('.dp4').daterangepicker(options, function (start, end, label) {

            var rng = (label != "Custom Range") ? label : start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD');
            $(".dp").attr("value", rng);

            docCookies.setItem('daterange', 'custom' + '|' + start.format('YYYY-MM-DD') + '|' + end.format('YYYY-MM-DD'), Infinity, '/');
            window.location.reload();
            return false;
        });


        options.opens = "right";
        $('.dp5').daterangepicker(options, function (start, end, label) {

            var rng = (label != "Custom Range") ? label : start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD');
            $(".dp").attr("value", rng);

            docCookies.setItem('daterange', 'custom' + '|' + start.format('YYYY-MM-DD') + '|' + end.format('YYYY-MM-DD'), Infinity, '/');
            window.location.reload();
            return false;
        });

        $(".downl").html("Request");

        function cb(start, end) {
            $('.dp').attr("value", moment.unix(1767225600).format('MMM D, YYYY') + ' - ' + moment.unix(1769903999).format('MMM D, YYYY'));
        }

        cb(start, end);
    });
</script>    <div class="hpanel">
    <div class="panel-heading hbuilt">
        <div class="btn-group btn-group-sm pull-right" data-toggle="buttons" id="morris-change">
            <label class="btn btn-default active">
                <input type="radio" name="options" id="option0" autocomplete="off" checked> <div class="circle"></div> Real-Time
            </label>

                            <label class="btn btn-default ">
                    <input type="radio" name="options" id="Day" autocomplete="off" checked> Day                </label>
                            <label class="btn btn-default ">
                    <input type="radio" name="options" id="Week" autocomplete="off" checked> Week                </label>
                            <label class="btn btn-default ">
                    <input type="radio" name="options" id="Month" autocomplete="off" checked> Month                </label>
                          
        </div>
        Audience Overview for Clustrmaps.com    </div>
    <div class="panel-body">
        <div class="row">
            
            <div class="col-md-12">
                <div class="mch " name="option0">
                    <div style="margin-bottom: 10px;">Pageviews per minute</div>
                    <div  id="mch0"></div>
                    <div class="row" style="font-size: 11px;font-weight: 500;">
                        <div class="col-md-3 col-sm-3 col-xs-3">-30 min</div>
                        <div class="col-md-3 col-sm-3 col-xs-3">-20 min</div>
                        <div class="col-md-3 col-sm-3 col-xs-3">-10 min</div>
                        <div class="col-md-3 col-sm-3  col-xs-3 text-right">-1 min</div>
                    </div>
                </div>
                                                    <div id="mch1" class="mch hidden" name="Day"></div>
                    <div id="mch2" class="mch hidden" name="Week"></div>
                    <div id="mch3" class="mch hidden" name="Month"></div>
            </div>
        </div>
    </div>
    <div class="panel-footer">
        <span class="pull-right active-user  text-nowrap">
            Last active user: <span class="last-active-user"><span class="flag16 f16us"></span> Houston, United States <time class="timeago text-nowrap" style="margin-left: 5px;" datetime="2026-01-29T15:46:00+00:00">2026-01-29 15:46:00</time></span>
        </span>
        Last update: <span class="last-update">Jan 29, 2026 3:46:03 UTC</span>
    </div>
</div>

<script>

    var byMin = true;

    Number.prototype.padZero = function (len) {
        var s = String(this), c = '0';
        len = len || 2;
        while (s.length < len)
            s = c + s;
        return s;
    }

    function number_format(number, decimals, dec_point, thousands_sep) {
        // Strip all characters but numerical ones.
        number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                s = '',
                toFixedFix = function (n, prec) {
                    var k = Math.pow(10, prec);
                    return '' + Math.round(n * k) / k;
                };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    var monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var dataSet = {"01-29-15-16":11,"01-29-15-17":15,"01-29-15-18":23,"01-29-15-19":20,"01-29-15-20":19,"01-29-15-21":11,"01-29-15-22":12,"01-29-15-23":9,"01-29-15-24":18,"01-29-15-25":16,"01-29-15-26":24,"01-29-15-27":21,"01-29-15-28":29,"01-29-15-29":16,"01-29-15-30":27,"01-29-15-31":19,"01-29-15-32":7,"01-29-15-33":14,"01-29-15-34":21,"01-29-15-35":19,"01-29-15-36":12,"01-29-15-37":19,"01-29-15-38":12,"01-29-15-39":16,"01-29-15-40":5,"01-29-15-41":18,"01-29-15-42":21,"01-29-15-43":15,"01-29-15-44":14,"01-29-15-45":19,"01-29-15-46":1};

    var set = [];

    function removeHead() {
        var keys = Object.keys(dataSet);
        delete dataSet[keys[0]];
    }

    function UTCNow() {
        var now = new Date();
        return new Date(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate(), now.getUTCHours(), now.getUTCMinutes(), now.getUTCSeconds());
    }


    function stringDate(d) {
        var m = (d.getMonth() + 1);

        var index = m.padZero(2) + "-" +
                d.getDate().padZero(2) + "-" +
                d.getHours().padZero(2);

        if (byMin) {
            index += "-" + d.getMinutes().padZero(2);
        }

        return index;
    }


    function liveStats(date) {
        var d = new Date(date);
        var index = stringDate(d);

        if (index in dataSet) {
            ++dataSet[index];
        } else {
            dataSet[index] = 1;
            removeHead();
        }
    }

    function updateLiveStats() {
        var index = stringDate(UTCNow());

        if (!(index in dataSet)) {
            dataSet[index] = 0;
            removeHead();
        }

        spark();
    }

    function spark() {
        var set = [];

        for (var i in dataSet) {
            set.push(dataSet[i]);
        }


        var bw = ($('#mch0').width() - 30 * 2) / 31;

        $('#mch0').sparkline(set, {
            type: 'bar',
            chartRangeMin: 0,
            barWidth: bw,
            barSpacing: 2,
            height: 180,
            width: 480,
            barColor: '#75c1e1',
            tooltipFormatter: function (sparkline, options, fields) {

                var offset = fields[0].offset;
                var value = fields[0].value;

                var ago = 30 - offset;

                var tm = (ago ? '-' : '') + ago + (byMin ? ' min ' : ' hour');
                return '<div class="ssp">' + tm + '</div><hr class="shr">' + value + ' Visits';
            }

        });
    }


    function option0() {
        if ($("#mch0").attr("created"))
            return;
        $("#mch0").attr("created", true);
        spark();
    }

    function Day() {

        if ($("#mch1").attr("created"))
            return;
        $("#mch1").attr("created", true);

        new Morris.Line({
            element: 'mch1',
            data: [{"date":"2025-12-31","a":"123707","b":"41840"},{"date":"2026-01-01","a":"122097","b":"41730"},{"date":"2026-01-02","a":"124191","b":"42721"},{"date":"2026-01-03","a":"118774","b":"40814"},{"date":"2026-01-04","a":"120872","b":"41693"},{"date":"2026-01-05","a":"127960","b":"42435"},{"date":"2026-01-06","a":"128266","b":"50156"},{"date":"2026-01-07","a":"130001","b":"43284"},{"date":"2026-01-08","a":"129987","b":"43544"},{"date":"2026-01-09","a":"79507","b":"37789"},{"date":"2026-01-10","a":"23855","b":"11143"},{"date":"2026-01-11","a":"25211","b":"12114"},{"date":"2026-01-12","a":"45265","b":"16543"},{"date":"2026-01-13","a":"74221","b":"46669"},{"date":"2026-01-14","a":"31987","b":"12719"},{"date":"2026-01-15","a":"27990","b":"12413"},{"date":"2026-01-16","a":"28093","b":"10648"},{"date":"2026-01-17","a":"15551","b":"6474"},{"date":"2026-01-18","a":"15002","b":"6196"},{"date":"2026-01-19","a":"22905","b":"7444"},{"date":"2026-01-20","a":"21424","b":"7729"},{"date":"2026-01-21","a":"18832","b":"7495"},{"date":"2026-01-22","a":"19188","b":"7493"},{"date":"2026-01-23","a":"17630","b":"7204"},{"date":"2026-01-24","a":"14927","b":"6358"},{"date":"2026-01-25","a":"14356","b":"6008"},{"date":"2026-01-26","a":"20603","b":"7446"},{"date":"2026-01-27","a":"19317","b":"7510"},{"date":"2026-01-28","a":"18707","b":"7339"}],
            xkey: 'date',
            ykeys: ['a', 'b'],
            labels: ['Pageviews', 'Uniques'],
            hideHover: 'auto',
            lineWidth: '2',
            hoverCallback: function (index, options, content, row) {
                var d = new Date(row.date);
                return "<div class='morris-hover-row-label'>" + monthNames[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear() + "</div><div class='morris-hover-point' style='color: #0b62a4'>Pageviews: " + number_format(row.a) + "</div><div class='morris-hover-point' style='color: #7A92A3'>Uniques: " + number_format(row.b) + "</div>";
            },
            xLabelFormat: function (x) {
                var d = new Date(x);
                return monthNames[d.getMonth()] + " " + d.getDate();
            }
        });
    }

    function Week() {
        if ($("#mch2").attr("created"))
            return;
        $("#mch2").attr("created", true);

        new Morris.Line({
            element: 'mch2',
            data: [{"date":"2025-07-13","a":"93291","b":"40445"},{"date":"2025-07-20","a":"93783","b":"40180"},{"date":"2025-07-27","a":"220324","b":"76495"},{"date":"2025-08-03","a":"462852","b":"138335"},{"date":"2025-08-10","a":"568792","b":"167182"},{"date":"2025-08-17","a":"532439","b":"169161"},{"date":"2025-08-24","a":"411005","b":"139122"},{"date":"2025-08-31","a":"268884","b":"101267"},{"date":"2025-09-07","a":"543609","b":"173392"},{"date":"2025-09-14","a":"584909","b":"184118"},{"date":"2025-09-21","a":"438936","b":"148808"},{"date":"2025-09-28","a":"161539","b":"63133"},{"date":"2025-10-05","a":"170864","b":"86060"},{"date":"2025-10-12","a":"180173","b":"94661"},{"date":"2025-10-19","a":"267759","b":"174362"},{"date":"2025-10-26","a":"217532","b":"127198"},{"date":"2025-11-02","a":"199566","b":"125427"},{"date":"2025-11-09","a":"343353","b":"122654"},{"date":"2025-11-16","a":"878869","b":"290974"},{"date":"2025-11-23","a":"1519469","b":"487381"},{"date":"2025-11-30","a":"1018092","b":"323159"},{"date":"2025-12-07","a":"980676","b":"318062"},{"date":"2025-12-14","a":"938695","b":"305103"},{"date":"2025-12-21","a":"868644","b":"295785"},{"date":"2025-12-28","a":865860,"b":292466},{"date":"2026-01-04","a":"740448","b":"270044"},{"date":"2026-01-11","a":"248318","b":"117580"},{"date":"2026-01-18","a":"129908","b":"49919"}],
            xkey: 'date',
            ykeys: ['a', 'b'],
            labels: ['Pageviews', 'Uniques'],
            hideHover: 'auto',
            lineWidth: '2',
            hoverCallback: function (index, options, content, row) {
                var d = new Date(row.date);
                var d2 = new Date(row.date);
                d2.setDate(d2.getDate() + 7);
                return "<div class='morris-hover-row-label'>" + monthNames[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear() + " - " + monthNames[d2.getMonth()] + " " + d2.getDate() + ", " + d2.getFullYear() + "</div><div class='morris-hover-point' style='color: #0b62a4'>Pageviews: " + number_format(row.a) + "</div><div class='morris-hover-point' style='color: #7A92A3'>Uniques: " + number_format(row.b) + "</div>";
            },
            xLabelFormat: function (x) {

                Date.prototype.getWeek = function () {
                    var onejan = new Date(this.getFullYear(), 0, 1);
                    return Math.ceil((((this - onejan) / 86400000) + onejan.getDay() + 1) / 7);
                }

                var d = new Date(x);
                return "Week " + d.getWeek();
            }
        });
    }
    function Month() {
        if ($("#mch3").attr("created"))
            return;
        $("#mch3").attr("created", true);

        new Morris.Line({
            element: 'mch3',
            data: [{"date":"2023-08-01","a":"625233","b":"276993"},{"date":"2023-09-01","a":"616698","b":"268386"},{"date":"2023-10-01","a":"585487","b":"248178"},{"date":"2023-11-01","a":"585341","b":"260225"},{"date":"2023-12-01","a":"592230","b":"250254"},{"date":"2024-01-01","a":"622745","b":"256453"},{"date":"2024-02-01","a":"581001","b":"237965"},{"date":"2024-03-01","a":"655508","b":"300182"},{"date":"2024-04-01","a":"574070","b":"254757"},{"date":"2024-05-01","a":"490306","b":"205309"},{"date":"2024-06-01","a":"414664","b":"179919"},{"date":"2024-07-01","a":"445635","b":"191823"},{"date":"2024-08-01","a":"431699","b":"173643"},{"date":"2024-09-01","a":"423104","b":"174489"},{"date":"2024-10-01","a":"423761","b":"175635"},{"date":"2024-11-01","a":"422965","b":"168310"},{"date":"2024-12-01","a":"419501","b":"170951"},{"date":"2025-01-01","a":"455239","b":"184722"},{"date":"2025-02-01","a":"431686","b":"176239"},{"date":"2025-03-01","a":"472219","b":"188575"},{"date":"2025-04-01","a":"410294","b":"171308"},{"date":"2025-05-01","a":"412726","b":"174787"},{"date":"2025-06-01","a":"457550","b":"166969"},{"date":"2025-07-01","a":"451612","b":"191337"},{"date":"2025-08-01","a":"2146470","b":"665932"},{"date":"2025-09-01","a":"1853690","b":"617895"},{"date":"2025-10-01","a":"899505","b":"501878"},{"date":"2025-11-01","a":"3109912","b":"1088017"},{"date":"2025-12-01","a":"4164016","b":"1363044"}],
            xkey: 'date',
            ykeys: ['a', 'b'],
            labels: ['Pageviews', 'Uniques'],
            hideHover: 'auto',
            lineWidth: '2',
            hoverCallback: function (index, options, content, row) {
                var d = new Date(row.date);
                return "<div class='morris-hover-row-label'>" + monthNames[d.getMonth()] + " " + d.getFullYear() + "</div><div class='morris-hover-point' style='color: #0b62a4'>Pageviews: " + number_format(row.a) + "</div><div class='morris-hover-point' style='color: #7A92A3'>Uniques: " + number_format(row.b) + "</div>";
            },
            xLabelFormat: function (x) {

                var d = new Date(x);
                return monthNames[d.getMonth()] + " " + d.getFullYear();
            }
        });
    }

option0();
</script>
<script>
    $(document).ready(function () {
        $('#morris-change label').click(function () {
            var curChart = $(this).find('input').attr('id');

            $.each($(".mch"), function (index, value) {
                if (curChart == $(this).attr("name")) {
                    $(this).removeClass("hidden");
                    window[curChart]();
                } else {
                    $(this).addClass("hidden");
                }
            });
        });
    });
</script>
    
<script type="text/javascript">
    var gdpData = {"CN":1069132,"US":272707,"CA":17421,"HK":14361,"DE":14155,"GB":13646,"":13016,"SG":10092,"BR":9488,"JP":8491,"IN":8314,"ES":7009,"FR":6671,"PK":6557,"EG":6525,"KR":6315,"CH":5356,"RU":5321,"UA":4747,"IT":4728,"AU":4221,"SE":3692,"AR":3605,"NL":3315,"TW":3245,"ID":3215,"DK":2673,"PH":2656,"TR":1981,"FI":1884,"PL":1880,"VN":1782,"KZ":1519,"GR":1519,"MX":1346,"CZ":1230,"BE":1183,"AE":1060,"IR":1042,"HU":1028,"BD":1023,"AT":924,"SK":922,"RO":918,"BG":777,"NP":771,"CO":767,"CL":731,"NO":729,"SA":670,"TH":654,"IL":601,"ZA":548,"NZ":496,"PT":493,"LT":387,"IE":386,"PE":352,"NG":343,"EE":282,"ET":271,"UZ":269,"LV":258,"AM":242,"QA":233,"BH":227,"KG":217,"VE":213,"MY":210,"SV":208,"BY":190,"HR":188,"DO":188,"GH":171,"TZ":165,"KE":158,"SY":150,"MA":142,"KH":140,"EC":134,"CR":130,"IQ":127,"LK":124,"DZ":106,"AZ":102,"AL":97,"GT":95,"PS":93,"SI":90,"PR":88,"CY":86,"GE":81,"MM":81,"MD":78,"PY":78,"JM":77,"UY":69,"RS":65,"HN":63,"LY":61,"MO":59,"CI":54,"JO":54,"UG":43,"AO":43,"BO":41,"NI":41,"PA":41,"TJ":41,"CU":38,"MK":34,"TN":32,"MG":29,"SO":27,"BA":27,"IS":25,"LU":24,"AF":24,"LB":23,"CM":21,"LA":21,"LI":20,"GM":20,"MZ":19,"ZM":19,"CD":19,"RW":18,"PW":18,"YE":14,"AW":13,"PG":12,"ML":12,"HT":12,"MU":11,"BN":11,"MW":10,"TT":10,"KW":10,"OM":10,"MN":10,"MT":10,"SN":9,"DM":9,"FJ":8,"BB":8,"TG":8,"BS":8,"MQ":7,"MV":6,"ZW":6,"SB":6,"SL":6,"SX":6,"PF":6,"SR":6,"BZ":5,"RE":5,"SZ":4,"SC":4,"BF":4,"BM":4,"SD":4,"ME":4,"LR":4,"GU":4,"TD":3,"GA":3,"KY":3,"AX":3,"CW":3,"NC":2,"GY":2,"GD":2,"TL":2,"AD":2,"TM":2,"SS":2,"KN":2,"CG":2,"GN":2,"GQ":2,"JE":2,"AG":2,"VA":1,"ST":1,"SJ":1,"MF":1,"LC":1,"MP":1,"MC":1,"GW":1,"GP":1,"GI":1,"GF":1,"ER":1,"DJ":1,"AI":1,"TC":1};

    $(function () {
        //$('.collapse').collapse();
        $('.country-control').click(function () {
            var $this = $(this);

            var $tr = $this.closest('tr');

            var iso = $this.data('country');
            var cls = 'country_' + iso;
            var sel = '.' + cls;


            if ($(sel).length > 0) {
                $(sel).toggle();
            } else {

                var url = '/ajax/countrydetail/1767225600/1769903999/' + $this.data('country') + '/clustrmaps.com';

                var code = "<tr class='" + cls + "'><td colspan='7'>Loading...</td></tr>";
                $(code).insertAfter($tr);


                $.get(url, {'id' : 85 }, function (data) {
                    $(sel).remove();
                    $(data).insertAfter($tr);
                });
            }
        });
    });

    var slOptions = {
        type: 'bar',
        chartRangeMin: 0,
        barWidth: 7,
        height: 33,
        width: '120px',
        barColor: '#618797',
        tooltipFormat: '<div class="ssp">{{offset:offset}}</div><hr class="shr">{{value}} Visits',
        tooltipValueLookups: {
            'offset': {"0":"20 Jan, 2026","1":"21 Jan, 2026","2":"22 Jan, 2026","3":"23 Jan, 2026","4":"24 Jan, 2026","5":"25 Jan, 2026","6":"26 Jan, 2026","7":"27 Jan, 2026","8":"28 Jan, 2026","9":"29 Jan, 2026"}        }
    };

    var slOptionsUniques = {
        type: 'bar',
        chartRangeMin: 0,
        barWidth: 7,
        barColor: '#a9b3b7',
        tooltipFormat: '{{value}} Uniques',
        composite: true
    };


</script>


<div class="hpanel">
    <div class="panel-heading hbuilt">
        <form class="form-inline pull-right" role="form"><strong data-count="1567884">1,567,884</strong> total visits for:
            <div class="form-group has-feedback hidden-xs" style="top:-4px">
                <input type="text" class="form-control btn-sm dp" id="dp3" style="width: 240px; font-weight: 400; font-size: 14px;">
                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
            </div>
        </form>
        Audience Geolocation Heatmap
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12"><div id="world-map-gdp" style="height: 400px"></div>
                <div id="heat-fill">
                    <span class="fill-a">0</span>
                    <span class="fill-b">1,069,132</span>
                </div>
            </div>
        </div>

    </div>
    <div class="panel-footer" style="padding: 0; background-color: #fff; font-size: 14px;">
        <div class="table-responsive">
            <table class="table table-hover audience table-striped" style="margin-bottom: 0;">
                <thead>
                    <tr class="active">
                        <th style="padding-left: 10px;">Country</th>
                        <th style="padding-left: 10px;">Locations</th>
                        <th>Visits</th>
                        <th>Uniques</th>
                        <th>Visit Depth</th>
                        <th>Visits/Uniques</th>
                        <th>Last Visit</th>
                    </tr>
                </thead>
                <tbody>

                                                <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag cn" style="margin-right: 5px; float: left;"></span> <span class="vstor">China</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CN" href="#coll1">322 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,069,132                                </td>
                                <td>414,875</td>
                                <td>
                                    2.58                                </td>
                                <td> <span id="cb_CN"></span></td>
                                <td>4 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CN').sparkline([2107,2122,1907,1930,1849,1786,1858,1872,1749,1214], $.extend(slOptions, {chartRangeMax: 2122}))
                                    .sparkline([843,859,869,864,798,725,758,763,729,583], $.extend(slOptionsUniques, {chartRangeMax: 2122}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag us" style="margin-right: 5px; float: left;"></span> <span class="vstor">United States</span>
                                </td>
                                <td>
                                                                                                                        4755 Locations
                                                                                                            </td>
                                <td>
                                    272,707                                </td>
                                <td>96,222</td>
                                <td>
                                    2.83                                </td>
                                <td> <span id="cb_US"></span></td>
                                <td>3 minutes ago  from Houston, Texas</td>
                            </tr>

                            <tr>
    
<tr class="country_ cntr" style="background-color: #f5f5f5;">
    <th style="padding-left: 10px;">Top  locations</th>
    <th style="padding-left: 10px;">Locations</th>
    <th>Visits</th>
    <th>Uniques</th>
    <th>Visit Depth</th>
    <th>Visits/Uniques</th>
    <th>Last Visit</th>
</tr>     <tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/TX/Austin'>Austin</a>, <a href='/d/TX'>TX</a>    </td>
    <td>
        3,969    </td>
    <td>372</td>
    <td>
        10.67    </td>
    <td><span id="sb_4671654"></span></td>
    <td>7 minutes ago  from Austin, Texas</td>    
</tr>

<script>
    var el = $('#sb_4671654');
    el.sparkline([198,162,188,171,129,160,210,118,51,49], $.extend ( slOptions, {chartRangeMax: 210}))
      .sparkline([17,17,13,8,10,12,15,13,7,10], $.extend( slOptionsUniques, {chartRangeMax: 210}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/CA/Los-Angeles'>Los Angeles</a>, <a href='/d/CA'>CA</a>    </td>
    <td>
        3,574    </td>
    <td>1,449</td>
    <td>
        2.47    </td>
    <td><span id="sb_5368361"></span></td>
    <td>24 minutes ago  from Los Angeles, California</td>    
</tr>

<script>
    var el = $('#sb_5368361');
    el.sparkline([94,187,99,103,91,104,144,129,99,68], $.extend ( slOptions, {chartRangeMax: 187}))
      .sparkline([47,62,51,49,40,40,60,53,47,31], $.extend( slOptionsUniques, {chartRangeMax: 187}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/VA/Ashburn'>Ashburn</a>, <a href='/d/VA'>VA</a>    </td>
    <td>
        3,372    </td>
    <td>501</td>
    <td>
        6.73    </td>
    <td><span id="sb_4744870"></span></td>
    <td>3 hours ago  from Ashburn, Virginia</td>    
</tr>

<script>
    var el = $('#sb_4744870');
    el.sparkline([25,44,29,43,22,24,42,28,30,14], $.extend ( slOptions, {chartRangeMax: 44}))
      .sparkline([16,21,17,21,13,16,27,21,20,11], $.extend( slOptionsUniques, {chartRangeMax: 44}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/WA/Seattle'>Seattle</a>, <a href='/d/WA'>WA</a>    </td>
    <td>
        2,947    </td>
    <td>994</td>
    <td>
        2.96    </td>
    <td><span id="sb_5809844"></span></td>
    <td>11 minutes ago  from Seattle, Washington</td>    
</tr>

<script>
    var el = $('#sb_5809844');
    el.sparkline([110,109,92,124,90,83,115,166,114,40], $.extend ( slOptions, {chartRangeMax: 166}))
      .sparkline([41,37,33,35,36,30,36,36,35,22], $.extend( slOptionsUniques, {chartRangeMax: 166}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/NY/New-York'>New York</a>, <a href='/d/NY'>NY</a>    </td>
    <td>
        1,955    </td>
    <td>783</td>
    <td>
        2.5    </td>
    <td><span id="sb_5128581"></span></td>
    <td>57 minutes ago  from New York, New York</td>    
</tr>

<script>
    var el = $('#sb_5128581');
    el.sparkline([61,67,75,96,100,33,51,46,58,19], $.extend ( slOptions, {chartRangeMax: 100}))
      .sparkline([32,30,31,35,18,23,30,23,28,11], $.extend( slOptionsUniques, {chartRangeMax: 100}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/CA/San-Jose'>San Jose</a>, <a href='/d/CA'>CA</a>    </td>
    <td>
        1,835    </td>
    <td>640</td>
    <td>
        2.87    </td>
    <td><span id="sb_5392171"></span></td>
    <td>1 hour ago  from San Jose, California</td>    
</tr>

<script>
    var el = $('#sb_5392171');
    el.sparkline([48,49,47,43,43,21,90,89,128,51], $.extend ( slOptions, {chartRangeMax: 128}))
      .sparkline([25,26,24,17,17,16,22,22,22,21], $.extend( slOptionsUniques, {chartRangeMax: 128}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/GA/Athens'>Athens</a>, <a href='/d/GA'>GA</a>    </td>
    <td>
        1,690    </td>
    <td>244</td>
    <td>
        6.93    </td>
    <td><span id="sb_4180386"></span></td>
    <td>6 minutes ago  from Athens, Georgia</td>    
</tr>

<script>
    var el = $('#sb_4180386');
    el.sparkline([83,65,47,73,19,18,22,19,13,59], $.extend ( slOptions, {chartRangeMax: 83}))
      .sparkline([8,9,10,11,5,5,7,10,4,9], $.extend( slOptionsUniques, {chartRangeMax: 83}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/UT/Salt-Lake-City'>Salt Lake City</a>, <a href='/d/UT'>UT</a>    </td>
    <td>
        1,464    </td>
    <td>279</td>
    <td>
        5.25    </td>
    <td><span id="sb_5780993"></span></td>
    <td>16 minutes ago  from Salt Lake City, Utah</td>    
</tr>

<script>
    var el = $('#sb_5780993');
    el.sparkline([66,50,48,49,34,50,47,50,73,37], $.extend ( slOptions, {chartRangeMax: 73}))
      .sparkline([11,10,9,8,4,4,5,13,8,6], $.extend( slOptionsUniques, {chartRangeMax: 73}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/CA/Stanford'>Stanford</a>, <a href='/d/CA'>CA</a>    </td>
    <td>
        1,352    </td>
    <td>318</td>
    <td>
        4.25    </td>
    <td><span id="sb_5398563"></span></td>
    <td>2 hours ago  from Stanford, California</td>    
</tr>

<script>
    var el = $('#sb_5398563');
    el.sparkline([50,72,74,59,47,47,42,57,49,33], $.extend ( slOptions, {chartRangeMax: 74}))
      .sparkline([19,23,14,13,8,11,9,18,15,9], $.extend( slOptionsUniques, {chartRangeMax: 74}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/TX/Houston'>Houston</a>, <a href='/d/TX'>TX</a>    </td>
    <td>
        1,336    </td>
    <td>570</td>
    <td>
        2.34    </td>
    <td><span id="sb_4699066"></span></td>
    <td>3 minutes ago  from Houston, Texas</td>    
</tr>

<script>
    var el = $('#sb_4699066');
    el.sparkline([54,70,36,32,24,39,23,81,94,129], $.extend ( slOptions, {chartRangeMax: 129}))
      .sparkline([28,25,20,21,9,18,17,25,22,19], $.extend( slOptionsUniques, {chartRangeMax: 129}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/IA/Council-Bluffs'>Council Bluffs</a>, <a href='/d/IA'>IA</a>    </td>
    <td>
        1,335    </td>
    <td>130</td>
    <td>
        10.27    </td>
    <td><span id="sb_4852832"></span></td>
    <td>26 minutes ago  from Council Bluffs, Iowa</td>    
</tr>

<script>
    var el = $('#sb_4852832');
    el.sparkline([57,62,56,53,22,29,70,72,59,34], $.extend ( slOptions, {chartRangeMax: 72}))
      .sparkline([4,4,6,4,3,4,6,6,4,4], $.extend( slOptionsUniques, {chartRangeMax: 72}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/FL/Miami'>Miami</a>, <a href='/d/FL'>FL</a>    </td>
    <td>
        1,308    </td>
    <td>760</td>
    <td>
        1.72    </td>
    <td><span id="sb_4164138"></span></td>
    <td>16 minutes ago  from Miami, Florida</td>    
</tr>

<script>
    var el = $('#sb_4164138');
    el.sparkline([54,93,50,39,23,17,51,61,74,19], $.extend ( slOptions, {chartRangeMax: 93}))
      .sparkline([40,54,36,29,17,13,32,29,23,12], $.extend( slOptionsUniques, {chartRangeMax: 93}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/PA/Pittsburgh'>Pittsburgh</a>, <a href='/d/PA'>PA</a>    </td>
    <td>
        1,305    </td>
    <td>291</td>
    <td>
        4.48    </td>
    <td><span id="sb_5206379"></span></td>
    <td>35 minutes ago  from Pittsburgh, Pennsylvania</td>    
</tr>

<script>
    var el = $('#sb_5206379');
    el.sparkline([77,66,83,83,39,29,75,52,29,11], $.extend ( slOptions, {chartRangeMax: 83}))
      .sparkline([13,15,15,12,14,6,14,5,11,8], $.extend( slOptionsUniques, {chartRangeMax: 83}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/FL/Delray-Beach'>Delray Beach</a>, <a href='/d/FL'>FL</a>    </td>
    <td>
        1,216    </td>
    <td>178</td>
    <td>
        6.83    </td>
    <td><span id="sb_4153132"></span></td>
    <td>34 minutes ago  from Delray Beach, Florida</td>    
</tr>

<script>
    var el = $('#sb_4153132');
    el.sparkline([46,26,70,40,27,26,22,23,19,21], $.extend ( slOptions, {chartRangeMax: 70}))
      .sparkline([7,6,5,7,8,4,7,5,7,3], $.extend( slOptionsUniques, {chartRangeMax: 70}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/CA/Mountain-View'>Mountain View</a>, <a href='/d/CA'>CA</a>    </td>
    <td>
        1,137    </td>
    <td>317</td>
    <td>
        3.59    </td>
    <td><span id="sb_5375480"></span></td>
    <td>10 minutes ago  from Mountain View, California</td>    
</tr>

<script>
    var el = $('#sb_5375480');
    el.sparkline([37,55,64,32,36,24,34,39,24,25], $.extend ( slOptions, {chartRangeMax: 64}))
      .sparkline([13,17,11,9,12,10,8,12,6,6], $.extend( slOptionsUniques, {chartRangeMax: 64}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/CA/San-Francisco'>San Francisco</a>, <a href='/d/CA'>CA</a>    </td>
    <td>
        1,047    </td>
    <td>304</td>
    <td>
        3.44    </td>
    <td><span id="sb_5391959"></span></td>
    <td>5 hours ago  from San Francisco, California</td>    
</tr>

<script>
    var el = $('#sb_5391959');
    el.sparkline([37,23,83,43,39,46,49,29,32,18], $.extend ( slOptions, {chartRangeMax: 83}))
      .sparkline([9,7,12,10,5,13,15,10,11,10], $.extend( slOptionsUniques, {chartRangeMax: 83}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/UT/Logan'>Logan</a>, <a href='/d/UT'>UT</a>    </td>
    <td>
        1,000    </td>
    <td>87</td>
    <td>
        11.49    </td>
    <td><span id="sb_5777544"></span></td>
    <td>11 hours ago  from Logan, Utah</td>    
</tr>

<script>
    var el = $('#sb_5777544');
    el.sparkline([67,49,48,125,2,25,32,74,52,20], $.extend ( slOptions, {chartRangeMax: 125}))
      .sparkline([4,2,4,5,1,2,3,5,4,2], $.extend( slOptionsUniques, {chartRangeMax: 125}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/CA/Roseville'>Roseville</a>, <a href='/d/CA'>CA</a>    </td>
    <td>
        998    </td>
    <td>143</td>
    <td>
        6.98    </td>
    <td><span id="sb_5388881"></span></td>
    <td>1 hour ago  from Roseville, California</td>    
</tr>

<script>
    var el = $('#sb_5388881');
    el.sparkline([23,14,25,45,40,25,22,37,24,9], $.extend ( slOptions, {chartRangeMax: 45}))
      .sparkline([5,4,5,5,4,5,4,5,4,3], $.extend( slOptionsUniques, {chartRangeMax: 45}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/MO/Kansas-City'>Kansas City</a>, <a href='/d/MO'>MO</a>    </td>
    <td>
        892    </td>
    <td>100</td>
    <td>
        8.92    </td>
    <td><span id="sb_4393217"></span></td>
    <td>27 minutes ago  from Kansas City, Missouri</td>    
</tr>

<script>
    var el = $('#sb_4393217');
    el.sparkline([63,36,33,22,25,37,14,20,34,6], $.extend ( slOptions, {chartRangeMax: 63}))
      .sparkline([5,4,2,1,2,2,3,3,5,2], $.extend( slOptionsUniques, {chartRangeMax: 63}));
</script>
<tr class="country_ cntr">
    <td style="padding-left: 10px;">
    </td>
    <td>
        <a href='/d/GA/Atlanta'>Atlanta</a>, <a href='/d/GA'>GA</a>    </td>
    <td>
        880    </td>
    <td>491</td>
    <td>
        1.79    </td>
    <td><span id="sb_4180439"></span></td>
    <td>7 minutes ago  from Atlanta, Georgia</td>    
</tr>

<script>
    var el = $('#sb_4180439');
    el.sparkline([56,43,29,25,27,18,24,49,38,6], $.extend ( slOptions, {chartRangeMax: 56}))
      .sparkline([20,19,17,14,14,14,15,23,22,6], $.extend( slOptionsUniques, {chartRangeMax: 56}));
</script>
</tr>
                            
                        <script>
                                                        $('#cb_US').sparkline([10695,8304,8445,7722,6503,6172,9905,8311,8109,4482], $.extend(slOptions, {chartRangeMax: 10695}))
                                    .sparkline([3748,3507,3464,3368,2965,2906,3584,3535,3480,2076], $.extend(slOptionsUniques, {chartRangeMax: 10695}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag ca" style="margin-right: 5px; float: left;"></span> <span class="vstor">Canada</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CA" href="#coll3">195 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    17,421                                </td>
                                <td>3,822</td>
                                <td>
                                    4.56                                </td>
                                <td> <span id="cb_CA"></span></td>
                                <td>4 minutes ago  from Summerland, British Columbia</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CA').sparkline([632,636,631,534,581,440,638,553,620,257], $.extend(slOptions, {chartRangeMax: 638}))
                                    .sparkline([157,137,141,137,123,107,150,135,155,95], $.extend(slOptionsUniques, {chartRangeMax: 638}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag hk" style="margin-right: 5px; float: left;"></span> <span class="vstor">Hong Kong</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="HK" href="#coll4">42 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    14,361                                </td>
                                <td>4,396</td>
                                <td>
                                    3.27                                </td>
                                <td> <span id="cb_HK"></span></td>
                                <td>4 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_HK').sparkline([519,486,534,442,367,343,536,618,558,567], $.extend(slOptions, {chartRangeMax: 618}))
                                    .sparkline([155,156,169,156,119,121,177,174,180,169], $.extend(slOptionsUniques, {chartRangeMax: 618}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag de" style="margin-right: 5px; float: left;"></span> <span class="vstor">Germany</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="DE" href="#coll5">286 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    14,155                                </td>
                                <td>3,778</td>
                                <td>
                                    3.75                                </td>
                                <td> <span id="cb_DE"></span></td>
                                <td>5 minutes ago  from Munich, Bavaria</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_DE').sparkline([479,469,512,657,626,613,839,633,672,368], $.extend(slOptions, {chartRangeMax: 839}))
                                    .sparkline([142,151,138,127,131,116,146,148,142,96], $.extend(slOptionsUniques, {chartRangeMax: 839}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag gb" style="margin-right: 5px; float: left;"></span> <span class="vstor">United Kingdom</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GB" href="#coll6">339 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    13,646                                </td>
                                <td>5,048</td>
                                <td>
                                    2.7                                </td>
                                <td> <span id="cb_GB"></span></td>
                                <td>5 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GB').sparkline([577,456,509,435,396,376,453,463,447,235], $.extend(slOptions, {chartRangeMax: 577}))
                                    .sparkline([225,195,194,169,135,140,195,194,195,112], $.extend(slOptionsUniques, {chartRangeMax: 577}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag sg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Singapore</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SG" href="#coll8">8 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    10,092                                </td>
                                <td>3,558</td>
                                <td>
                                    2.84                                </td>
                                <td> <span id="cb_SG"></span></td>
                                <td>23 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SG').sparkline([356,317,333,372,325,361,533,545,537,367], $.extend(slOptions, {chartRangeMax: 545}))
                                    .sparkline([109,117,123,117,112,119,119,117,117,81], $.extend(slOptionsUniques, {chartRangeMax: 545}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag br" style="margin-right: 5px; float: left;"></span> <span class="vstor">Brazil</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BR" href="#coll9">465 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    9,488                                </td>
                                <td>4,838</td>
                                <td>
                                    1.96                                </td>
                                <td> <span id="cb_BR"></span></td>
                                <td>4 minutes ago  from João Pessoa, Paraiba</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BR').sparkline([385,347,357,402,261,307,356,541,373,209], $.extend(slOptions, {chartRangeMax: 541}))
                                    .sparkline([188,184,204,195,142,150,190,217,180,117], $.extend(slOptionsUniques, {chartRangeMax: 541}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag jp" style="margin-right: 5px; float: left;"></span> <span class="vstor">Japan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="JP" href="#coll10">152 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    8,491                                </td>
                                <td>2,665</td>
                                <td>
                                    3.19                                </td>
                                <td> <span id="cb_JP"></span></td>
                                <td>14 minutes ago  from Shibuya, Tokyo</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_JP').sparkline([304,321,364,228,234,232,412,390,404,228], $.extend(slOptions, {chartRangeMax: 412}))
                                    .sparkline([90,95,93,87,82,69,106,103,98,86], $.extend(slOptionsUniques, {chartRangeMax: 412}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag in" style="margin-right: 5px; float: left;"></span> <span class="vstor">India</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IN" href="#coll11">178 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    8,314                                </td>
                                <td>3,996</td>
                                <td>
                                    2.08                                </td>
                                <td> <span id="cb_IN"></span></td>
                                <td>8 minutes ago  from Mumbai, Maharashtra</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IN').sparkline([366,343,355,369,203,146,256,280,318,273], $.extend(slOptions, {chartRangeMax: 369}))
                                    .sparkline([168,147,168,164,124,81,112,138,168,159], $.extend(slOptionsUniques, {chartRangeMax: 369}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag es" style="margin-right: 5px; float: left;"></span> <span class="vstor">Spain</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ES" href="#coll12">241 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    7,009                                </td>
                                <td>2,222</td>
                                <td>
                                    3.15                                </td>
                                <td> <span id="cb_ES"></span></td>
                                <td>7 minutes ago  from Cervello, Catalonia</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ES').sparkline([240,241,332,297,252,283,268,243,353,150], $.extend(slOptions, {chartRangeMax: 353}))
                                    .sparkline([72,86,86,96,67,70,71,83,89,52], $.extend(slOptionsUniques, {chartRangeMax: 353}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag fr" style="margin-right: 5px; float: left;"></span> <span class="vstor">France</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="FR" href="#coll13">418 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6,671                                </td>
                                <td>2,858</td>
                                <td>
                                    2.33                                </td>
                                <td> <span id="cb_FR"></span></td>
                                <td>10 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_FR').sparkline([236,248,255,208,162,190,278,277,241,125], $.extend(slOptions, {chartRangeMax: 278}))
                                    .sparkline([104,108,108,96,66,83,104,116,101,62], $.extend(slOptionsUniques, {chartRangeMax: 278}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag pk" style="margin-right: 5px; float: left;"></span> <span class="vstor">Pakistan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PK" href="#coll14">37 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6,557                                </td>
                                <td>1,912</td>
                                <td>
                                    3.43                                </td>
                                <td> <span id="cb_PK"></span></td>
                                <td>4 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PK').sparkline([276,299,320,291,147,15,268,367,333,107], $.extend(slOptions, {chartRangeMax: 367}))
                                    .sparkline([100,98,94,94,58,12,87,111,97,52], $.extend(slOptionsUniques, {chartRangeMax: 367}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag eg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Egypt</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="EG" href="#coll15">26 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6,525                                </td>
                                <td>843</td>
                                <td>
                                    7.74                                </td>
                                <td> <span id="cb_EG"></span></td>
                                <td>6 minutes ago  from Cairo, Muhafazat al Qahirah</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_EG').sparkline([558,436,293,221,50,31,318,320,306,116], $.extend(slOptions, {chartRangeMax: 558}))
                                    .sparkline([40,42,38,39,9,5,35,43,38,23], $.extend(slOptionsUniques, {chartRangeMax: 558}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag kr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Republic of Korea</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="KR" href="#coll16">88 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6,315                                </td>
                                <td>1,851</td>
                                <td>
                                    3.41                                </td>
                                <td> <span id="cb_KR"></span></td>
                                <td>4 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KR').sparkline([246,283,251,221,143,133,181,333,292,254], $.extend(slOptions, {chartRangeMax: 333}))
                                    .sparkline([64,64,74,59,45,47,71,63,82,56], $.extend(slOptionsUniques, {chartRangeMax: 333}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag ch" style="margin-right: 5px; float: left;"></span> <span class="vstor">Switzerland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CH" href="#coll17">75 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    5,356                                </td>
                                <td>1,386</td>
                                <td>
                                    3.86                                </td>
                                <td> <span id="cb_CH"></span></td>
                                <td>7 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CH').sparkline([193,242,357,266,117,331,219,167,186,147], $.extend(slOptions, {chartRangeMax: 357}))
                                    .sparkline([55,56,61,52,35,43,59,50,52,33], $.extend(slOptionsUniques, {chartRangeMax: 357}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag ru" style="margin-right: 5px; float: left;"></span> <span class="vstor">Russia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="RU" href="#coll18">260 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    5,321                                </td>
                                <td>2,821</td>
                                <td>
                                    1.89                                </td>
                                <td> <span id="cb_RU"></span></td>
                                <td>9 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_RU').sparkline([180,169,154,115,155,123,198,172,194,94], $.extend(slOptions, {chartRangeMax: 198}))
                                    .sparkline([114,93,92,67,91,64,99,101,109,65], $.extend(slOptionsUniques, {chartRangeMax: 198}));
                        </script>
                        
                    
                                                    <tr >
                                <td style="padding-left: 10px;">
                                    <span class="flag ua" style="margin-right: 5px; float: left;"></span> <span class="vstor">Ukraine</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="UA" href="#coll19">67 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4,747                                </td>
                                <td>1,183</td>
                                <td>
                                    4.01                                </td>
                                <td> <span id="cb_UA"></span></td>
                                <td>10 minutes ago  from Izmail, Odessa</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_UA').sparkline([198,228,206,183,172,114,166,148,150,66], $.extend(slOptions, {chartRangeMax: 228}))
                                    .sparkline([52,41,43,38,37,48,44,39,38,28], $.extend(slOptionsUniques, {chartRangeMax: 228}));
                        </script>
                        
                    
                                                    <tr id="sm">
                                <td colspan="7" style="text-align: center;">
                                    <button class="btn btn-default" type="submit" style="padding: 6px 120px" onclick='$("#sm").hide();
                                            $(".sm2").removeClass("hidden");'>Load more <i class="fa fa-arrow-down"></i></button>
                                </td>
                            </tr>
                                                        <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag it" style="margin-right: 5px; float: left;"></span> <span class="vstor">Italy</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IT" href="#coll20">206 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4,728                                </td>
                                <td>1,390</td>
                                <td>
                                    3.4                                </td>
                                <td> <span id="cb_IT"></span></td>
                                <td>4 minutes ago  from Rimini, Emilia-Romagna</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IT').sparkline([207,131,123,150,93,108,320,343,371,132], $.extend(slOptions, {chartRangeMax: 371}))
                                    .sparkline([55,50,41,49,35,31,59,57,70,38], $.extend(slOptionsUniques, {chartRangeMax: 371}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag au" style="margin-right: 5px; float: left;"></span> <span class="vstor">Australia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AU" href="#coll21">144 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4,221                                </td>
                                <td>1,910</td>
                                <td>
                                    2.21                                </td>
                                <td> <span id="cb_AU"></span></td>
                                <td>3 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AU').sparkline([153,150,204,201,99,120,133,187,137,87], $.extend(slOptions, {chartRangeMax: 204}))
                                    .sparkline([81,64,78,66,56,53,69,78,72,54], $.extend(slOptionsUniques, {chartRangeMax: 204}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag se" style="margin-right: 5px; float: left;"></span> <span class="vstor">Sweden</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SE" href="#coll22">66 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3,692                                </td>
                                <td>1,390</td>
                                <td>
                                    2.66                                </td>
                                <td> <span id="cb_SE"></span></td>
                                <td>37 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SE').sparkline([94,148,102,85,70,66,99,101,91,52], $.extend(slOptions, {chartRangeMax: 148}))
                                    .sparkline([48,46,52,52,47,37,49,56,48,27], $.extend(slOptionsUniques, {chartRangeMax: 148}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ar" style="margin-right: 5px; float: left;"></span> <span class="vstor">Argentina</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AR" href="#coll23">87 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3,605                                </td>
                                <td>645</td>
                                <td>
                                    5.59                                </td>
                                <td> <span id="cb_AR"></span></td>
                                <td>14 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AR').sparkline([231,62,163,152,38,155,121,99,43,107], $.extend(slOptions, {chartRangeMax: 231}))
                                    .sparkline([30,22,22,22,17,16,19,18,20,20], $.extend(slOptionsUniques, {chartRangeMax: 231}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag nl" style="margin-right: 5px; float: left;"></span> <span class="vstor">Netherlands</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NL" href="#coll24">126 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3,315                                </td>
                                <td>1,573</td>
                                <td>
                                    2.11                                </td>
                                <td> <span id="cb_NL"></span></td>
                                <td>34 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NL').sparkline([132,118,141,107,71,92,152,133,120,76], $.extend(slOptions, {chartRangeMax: 152}))
                                    .sparkline([58,67,62,56,38,45,60,70,55,31], $.extend(slOptionsUniques, {chartRangeMax: 152}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Taiwan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TW" href="#coll25">25 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3,245                                </td>
                                <td>1,566</td>
                                <td>
                                    2.07                                </td>
                                <td> <span id="cb_TW"></span></td>
                                <td>24 minutes ago  from Taipei, Taipei</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TW').sparkline([123,96,90,91,83,68,106,149,72,83], $.extend(slOptions, {chartRangeMax: 149}))
                                    .sparkline([64,50,46,49,44,44,59,63,49,39], $.extend(slOptionsUniques, {chartRangeMax: 149}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag id" style="margin-right: 5px; float: left;"></span> <span class="vstor">Indonesia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ID" href="#coll26">81 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3,215                                </td>
                                <td>1,834</td>
                                <td>
                                    1.75                                </td>
                                <td> <span id="cb_ID"></span></td>
                                <td>31 minutes ago  from Jakarta, Daerah Khusus Ibukota Jakarta</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ID').sparkline([90,141,113,84,130,128,117,114,86,88], $.extend(slOptions, {chartRangeMax: 141}))
                                    .sparkline([56,77,68,59,62,86,81,75,65,59], $.extend(slOptionsUniques, {chartRangeMax: 141}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag dk" style="margin-right: 5px; float: left;"></span> <span class="vstor">Denmark</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="DK" href="#coll27">42 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2,673                                </td>
                                <td>578</td>
                                <td>
                                    4.62                                </td>
                                <td> <span id="cb_DK"></span></td>
                                <td>20 minutes ago  from Aalborg, North Denmark</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_DK').sparkline([112,91,149,113,98,56,68,95,68,57], $.extend(slOptions, {chartRangeMax: 149}))
                                    .sparkline([21,21,23,26,19,19,14,23,25,15], $.extend(slOptionsUniques, {chartRangeMax: 149}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ph" style="margin-right: 5px; float: left;"></span> <span class="vstor">Philippines</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PH" href="#coll28">73 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2,656                                </td>
                                <td>1,154</td>
                                <td>
                                    2.3                                </td>
                                <td> <span id="cb_PH"></span></td>
                                <td>3 minutes ago  from Dasmarinas, Calabarzon</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PH').sparkline([98,109,130,115,98,43,106,180,220,53], $.extend(slOptions, {chartRangeMax: 220}))
                                    .sparkline([53,54,54,55,43,16,50,54,68,39], $.extend(slOptionsUniques, {chartRangeMax: 220}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Turkey</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TR" href="#coll29">60 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,981                                </td>
                                <td>953</td>
                                <td>
                                    2.08                                </td>
                                <td> <span id="cb_TR"></span></td>
                                <td>10 minutes ago  from Izmir, Izmir</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TR').sparkline([51,66,66,67,54,48,59,88,51,42], $.extend(slOptions, {chartRangeMax: 88}))
                                    .sparkline([20,25,25,29,22,22,28,33,24,20], $.extend(slOptionsUniques, {chartRangeMax: 88}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag fi" style="margin-right: 5px; float: left;"></span> <span class="vstor">Finland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="FI" href="#coll30">23 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,884                                </td>
                                <td>398</td>
                                <td>
                                    4.73                                </td>
                                <td> <span id="cb_FI"></span></td>
                                <td>14 minutes ago  from Mikkeli, Southern Savonia</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_FI').sparkline([53,69,84,93,58,69,77,67,56,57], $.extend(slOptions, {chartRangeMax: 93}))
                                    .sparkline([13,17,17,15,14,14,13,20,12,13], $.extend(slOptionsUniques, {chartRangeMax: 93}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pl" style="margin-right: 5px; float: left;"></span> <span class="vstor">Poland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PL" href="#coll31">99 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,880                                </td>
                                <td>752</td>
                                <td>
                                    2.5                                </td>
                                <td> <span id="cb_PL"></span></td>
                                <td>18 minutes ago  from Warsaw, Masovian Voivodeship</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PL').sparkline([72,58,61,57,69,80,69,72,112,63], $.extend(slOptions, {chartRangeMax: 112}))
                                    .sparkline([22,24,25,25,25,25,23,35,24,14], $.extend(slOptionsUniques, {chartRangeMax: 112}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag vn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Vietnam</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="VN" href="#coll32">27 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,782                                </td>
                                <td>737</td>
                                <td>
                                    2.42                                </td>
                                <td> <span id="cb_VN"></span></td>
                                <td>20 minutes ago  from Quang Tri, Tinh Quang Tri</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_VN').sparkline([37,49,52,44,33,64,52,58,53,54], $.extend(slOptions, {chartRangeMax: 64}))
                                    .sparkline([18,20,25,22,17,20,23,24,23,21], $.extend(slOptionsUniques, {chartRangeMax: 64}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag kz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Kazakhstan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="KZ" href="#coll33">29 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,519                                </td>
                                <td>1,154</td>
                                <td>
                                    1.32                                </td>
                                <td> <span id="cb_KZ"></span></td>
                                <td>22 minutes ago  from Almaty, Almaty Qalasy</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KZ').sparkline([47,49,59,53,55,36,63,53,68,39], $.extend(slOptions, {chartRangeMax: 68}))
                                    .sparkline([38,38,42,40,37,31,47,46,46,30], $.extend(slOptionsUniques, {chartRangeMax: 68}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Greece</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GR" href="#coll34">24 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,519                                </td>
                                <td>684</td>
                                <td>
                                    2.22                                </td>
                                <td> <span id="cb_GR"></span></td>
                                <td>5 minutes ago  from Ioannina, Epirus</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GR').sparkline([60,56,38,39,41,42,62,57,64,30], $.extend(slOptions, {chartRangeMax: 64}))
                                    .sparkline([26,33,24,27,22,14,34,28,26,17], $.extend(slOptionsUniques, {chartRangeMax: 64}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mx" style="margin-right: 5px; float: left;"></span> <span class="vstor">Mexico</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MX" href="#coll35">98 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,346                                </td>
                                <td>799</td>
                                <td>
                                    1.68                                </td>
                                <td> <span id="cb_MX"></span></td>
                                <td>50 minutes ago  from Guadalajara, Jalisco</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MX').sparkline([36,55,74,47,19,43,57,40,35,16], $.extend(slOptions, {chartRangeMax: 74}))
                                    .sparkline([27,40,44,29,13,19,33,33,25,15], $.extend(slOptionsUniques, {chartRangeMax: 74}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Czech Republic</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CZ" href="#coll36">50 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,230                                </td>
                                <td>480</td>
                                <td>
                                    2.56                                </td>
                                <td> <span id="cb_CZ"></span></td>
                                <td>1 hour ago  from Pilsen, Plzensky kraj</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CZ').sparkline([22,27,26,24,17,10,20,16,13,7], $.extend(slOptions, {chartRangeMax: 27}))
                                    .sparkline([17,18,15,17,15,9,13,11,7,6], $.extend(slOptionsUniques, {chartRangeMax: 27}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag be" style="margin-right: 5px; float: left;"></span> <span class="vstor">Belgium</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BE" href="#coll37">65 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,183                                </td>
                                <td>438</td>
                                <td>
                                    2.7                                </td>
                                <td> <span id="cb_BE"></span></td>
                                <td>6 minutes ago  from Koersel, Flanders</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BE').sparkline([43,54,27,33,44,38,67,30,22,15], $.extend(slOptions, {chartRangeMax: 67}))
                                    .sparkline([19,16,14,15,14,10,27,13,10,6], $.extend(slOptionsUniques, {chartRangeMax: 67}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ae" style="margin-right: 5px; float: left;"></span> <span class="vstor">United Arab Emirates</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AE" href="#coll38">5 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,060                                </td>
                                <td>452</td>
                                <td>
                                    2.35                                </td>
                                <td> <span id="cb_AE"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AE').sparkline([36,33,50,42,26,56,38,66,62,37], $.extend(slOptions, {chartRangeMax: 66}))
                                    .sparkline([16,14,22,18,17,16,14,14,17,12], $.extend(slOptionsUniques, {chartRangeMax: 66}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ir" style="margin-right: 5px; float: left;"></span> <span class="vstor">Iran</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IR" href="#coll39">14 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,042                                </td>
                                <td>551</td>
                                <td>
                                    1.89                                </td>
                                <td> <span id="cb_IR"></span></td>
                                <td>9 minutes ago  from Tiran, Isfahan</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IR').sparkline([20,23,31,41,38,31,39,39,49,43], $.extend(slOptions, {chartRangeMax: 49}))
                                    .sparkline([17,18,13,15,13,19,18,14,30,23], $.extend(slOptionsUniques, {chartRangeMax: 49}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag hu" style="margin-right: 5px; float: left;"></span> <span class="vstor">Hungary</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="HU" href="#coll40">51 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,028                                </td>
                                <td>427</td>
                                <td>
                                    2.41                                </td>
                                <td> <span id="cb_HU"></span></td>
                                <td>8 minutes ago  from Budapest, Budapest fovaros</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_HU').sparkline([36,29,35,44,40,32,35,32,47,23], $.extend(slOptions, {chartRangeMax: 47}))
                                    .sparkline([12,16,14,18,17,11,15,15,15,9], $.extend(slOptionsUniques, {chartRangeMax: 47}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bd" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bangladesh</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BD" href="#coll41">27 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    1,023                                </td>
                                <td>505</td>
                                <td>
                                    2.03                                </td>
                                <td> <span id="cb_BD"></span></td>
                                <td>1 hour ago  from Dhaka, Dhaka Division</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BD').sparkline([36,45,34,20,31,31,46,40,48,15], $.extend(slOptions, {chartRangeMax: 48}))
                                    .sparkline([16,12,12,11,13,17,20,21,25,10], $.extend(slOptionsUniques, {chartRangeMax: 48}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag at" style="margin-right: 5px; float: left;"></span> <span class="vstor">Austria</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AT" href="#coll42">29 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    924                                </td>
                                <td>267</td>
                                <td>
                                    3.46                                </td>
                                <td> <span id="cb_AT"></span></td>
                                <td>2 hours ago  from Klagenfurt, Carinthia</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AT').sparkline([55,62,46,37,15,28,20,31,23,15], $.extend(slOptions, {chartRangeMax: 62}))
                                    .sparkline([14,12,14,17,7,9,6,12,8,7], $.extend(slOptionsUniques, {chartRangeMax: 62}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sk" style="margin-right: 5px; float: left;"></span> <span class="vstor">Slovak Republic</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SK" href="#coll43">26 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    922                                </td>
                                <td>282</td>
                                <td>
                                    3.27                                </td>
                                <td> <span id="cb_SK"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SK').sparkline([34,42,21,34,39,33,30,24,24,16], $.extend(slOptions, {chartRangeMax: 42}))
                                    .sparkline([9,8,4,5,9,9,7,6,7,5], $.extend(slOptionsUniques, {chartRangeMax: 42}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ro" style="margin-right: 5px; float: left;"></span> <span class="vstor">Romania</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="RO" href="#coll44">46 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    918                                </td>
                                <td>516</td>
                                <td>
                                    1.78                                </td>
                                <td> <span id="cb_RO"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_RO').sparkline([28,41,22,20,52,31,26,20,20,19], $.extend(slOptions, {chartRangeMax: 52}))
                                    .sparkline([20,25,14,13,21,20,13,16,15,14], $.extend(slOptionsUniques, {chartRangeMax: 52}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bulgaria</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BG" href="#coll45">27 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    777                                </td>
                                <td>347</td>
                                <td>
                                    2.24                                </td>
                                <td> <span id="cb_BG"></span></td>
                                <td>40 minutes ago  from Plovdiv, Plovdiv</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BG').sparkline([23,31,11,20,25,16,27,32,17,21], $.extend(slOptions, {chartRangeMax: 32}))
                                    .sparkline([10,13,8,13,11,8,11,13,12,13], $.extend(slOptionsUniques, {chartRangeMax: 32}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag np" style="margin-right: 5px; float: left;"></span> <span class="vstor">Nepal</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NP" href="#coll46">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    771                                </td>
                                <td>171</td>
                                <td>
                                    4.51                                </td>
                                <td> <span id="cb_NP"></span></td>
                                <td>8 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NP').sparkline([16,19,88,10,25,10,21,8,11,35], $.extend(slOptions, {chartRangeMax: 88}))
                                    .sparkline([5,4,6,3,8,5,4,3,5,6], $.extend(slOptionsUniques, {chartRangeMax: 88}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag co" style="margin-right: 5px; float: left;"></span> <span class="vstor">Colombia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CO" href="#coll47">33 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    767                                </td>
                                <td>447</td>
                                <td>
                                    1.72                                </td>
                                <td> <span id="cb_CO"></span></td>
                                <td>26 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CO').sparkline([31,51,28,30,32,31,40,30,28,18], $.extend(slOptions, {chartRangeMax: 51}))
                                    .sparkline([21,25,17,13,15,15,15,18,18,12], $.extend(slOptionsUniques, {chartRangeMax: 51}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cl" style="margin-right: 5px; float: left;"></span> <span class="vstor">Chile</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CL" href="#coll48">31 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    731                                </td>
                                <td>370</td>
                                <td>
                                    1.98                                </td>
                                <td> <span id="cb_CL"></span></td>
                                <td>35 minutes ago  from Santiago, Santiago Metropolitan</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CL').sparkline([25,29,27,10,20,17,16,21,27,8], $.extend(slOptions, {chartRangeMax: 29}))
                                    .sparkline([14,16,12,9,7,9,11,15,11,5], $.extend(slOptionsUniques, {chartRangeMax: 29}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag no" style="margin-right: 5px; float: left;"></span> <span class="vstor">Norway</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NO" href="#coll49">50 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    729                                </td>
                                <td>348</td>
                                <td>
                                    2.09                                </td>
                                <td> <span id="cb_NO"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NO').sparkline([34,24,11,21,15,19,16,33,40,13], $.extend(slOptions, {chartRangeMax: 40}))
                                    .sparkline([14,17,7,11,9,8,9,9,16,9], $.extend(slOptionsUniques, {chartRangeMax: 40}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sa" style="margin-right: 5px; float: left;"></span> <span class="vstor">Saudi Arabia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SA" href="#coll50">9 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    670                                </td>
                                <td>289</td>
                                <td>
                                    2.32                                </td>
                                <td> <span id="cb_SA"></span></td>
                                <td>29 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SA').sparkline([37,21,16,25,16,16,25,30,29,24], $.extend(slOptions, {chartRangeMax: 37}))
                                    .sparkline([13,8,8,13,4,9,11,12,11,10], $.extend(slOptionsUniques, {chartRangeMax: 37}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag th" style="margin-right: 5px; float: left;"></span> <span class="vstor">Thailand</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TH" href="#coll51">32 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    654                                </td>
                                <td>323</td>
                                <td>
                                    2.02                                </td>
                                <td> <span id="cb_TH"></span></td>
                                <td>3 hours ago  from Bangkok, Bangkok</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TH').sparkline([25,18,14,18,12,22,21,18,22,7], $.extend(slOptions, {chartRangeMax: 25}))
                                    .sparkline([13,9,10,13,5,7,13,11,10,4], $.extend(slOptionsUniques, {chartRangeMax: 25}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag il" style="margin-right: 5px; float: left;"></span> <span class="vstor">Israel</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IL" href="#coll52">22 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    601                                </td>
                                <td>295</td>
                                <td>
                                    2.04                                </td>
                                <td> <span id="cb_IL"></span></td>
                                <td>31 minutes ago  from Tel Aviv, Tel Aviv</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IL').sparkline([24,25,23,17,14,28,20,14,20,5], $.extend(slOptions, {chartRangeMax: 28}))
                                    .sparkline([9,11,8,10,8,13,9,9,9,3], $.extend(slOptionsUniques, {chartRangeMax: 28}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag za" style="margin-right: 5px; float: left;"></span> <span class="vstor">South Africa</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ZA" href="#coll53">21 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    548                                </td>
                                <td>285</td>
                                <td>
                                    1.92                                </td>
                                <td> <span id="cb_ZA"></span></td>
                                <td>43 minutes ago  from Johannesburg, Gauteng</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ZA').sparkline([13,22,10,16,16,3,12,13,22,34], $.extend(slOptions, {chartRangeMax: 34}))
                                    .sparkline([11,13,9,11,10,2,9,8,13,11], $.extend(slOptionsUniques, {chartRangeMax: 34}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag nz" style="margin-right: 5px; float: left;"></span> <span class="vstor">New Zealand</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NZ" href="#coll54">15 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    496                                </td>
                                <td>275</td>
                                <td>
                                    1.8                                </td>
                                <td> <span id="cb_NZ"></span></td>
                                <td>2 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NZ').sparkline([17,20,22,8,19,13,19,17,31,8], $.extend(slOptions, {chartRangeMax: 31}))
                                    .sparkline([11,13,8,6,8,9,11,7,10,5], $.extend(slOptionsUniques, {chartRangeMax: 31}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pt" style="margin-right: 5px; float: left;"></span> <span class="vstor">Portugal</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PT" href="#coll55">73 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    493                                </td>
                                <td>316</td>
                                <td>
                                    1.56                                </td>
                                <td> <span id="cb_PT"></span></td>
                                <td>1 hour ago  from Porto, Distrito do Porto</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PT').sparkline([17,14,26,29,21,14,12,25,9,8], $.extend(slOptions, {chartRangeMax: 29}))
                                    .sparkline([9,10,17,16,15,7,8,11,9,6], $.extend(slOptionsUniques, {chartRangeMax: 29}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lt" style="margin-right: 5px; float: left;"></span> <span class="vstor">Republic of Lithuania</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LT" href="#coll56">17 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    387                                </td>
                                <td>198</td>
                                <td>
                                    1.95                                </td>
                                <td> <span id="cb_LT"></span></td>
                                <td>7 minutes ago  from Kriūkai, Marijampolė County</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LT').sparkline([8,13,8,7,9,6,18,20,17,10], $.extend(slOptions, {chartRangeMax: 20}))
                                    .sparkline([6,6,4,6,9,6,8,8,7,7], $.extend(slOptionsUniques, {chartRangeMax: 20}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ie" style="margin-right: 5px; float: left;"></span> <span class="vstor">Ireland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IE" href="#coll57">19 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    386                                </td>
                                <td>273</td>
                                <td>
                                    1.41                                </td>
                                <td> <span id="cb_IE"></span></td>
                                <td>4 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IE').sparkline([16,13,13,9,6,11,4,16,10,8], $.extend(slOptions, {chartRangeMax: 16}))
                                    .sparkline([13,10,12,8,5,11,4,11,10,7], $.extend(slOptionsUniques, {chartRangeMax: 16}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pe" style="margin-right: 5px; float: left;"></span> <span class="vstor">Peru</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PE" href="#coll58">17 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    352                                </td>
                                <td>185</td>
                                <td>
                                    1.9                                </td>
                                <td> <span id="cb_PE"></span></td>
                                <td>1 hour ago  from Lima, Provincia de Lima</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PE').sparkline([14,24,19,18,8,9,11,13,8,13], $.extend(slOptions, {chartRangeMax: 24}))
                                    .sparkline([9,5,10,5,7,5,7,7,3,6], $.extend(slOptionsUniques, {chartRangeMax: 24}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ng" style="margin-right: 5px; float: left;"></span> <span class="vstor">Nigeria</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NG" href="#coll59">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    343                                </td>
                                <td>224</td>
                                <td>
                                    1.53                                </td>
                                <td> <span id="cb_NG"></span></td>
                                <td>29 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NG').sparkline([13,10,15,11,8,8,17,14,13,11], $.extend(slOptions, {chartRangeMax: 17}))
                                    .sparkline([7,10,4,9,6,7,13,12,9,8], $.extend(slOptionsUniques, {chartRangeMax: 17}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ee" style="margin-right: 5px; float: left;"></span> <span class="vstor">Estonia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="EE" href="#coll60">10 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    282                                </td>
                                <td>169</td>
                                <td>
                                    1.67                                </td>
                                <td> <span id="cb_EE"></span></td>
                                <td>32 minutes ago  from Tallinn, Harju</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_EE').sparkline([15,7,10,8,9,7,11,15,17,6], $.extend(slOptions, {chartRangeMax: 17}))
                                    .sparkline([10,5,8,6,8,2,9,9,11,1], $.extend(slOptionsUniques, {chartRangeMax: 17}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag et" style="margin-right: 5px; float: left;"></span> <span class="vstor">Ethiopia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ET" href="#coll61">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    271                                </td>
                                <td>209</td>
                                <td>
                                    1.3                                </td>
                                <td> <span id="cb_ET"></span></td>
                                <td>3 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ET').sparkline([5,20,12,23,2,3,10,6,9,3], $.extend(slOptions, {chartRangeMax: 23}))
                                    .sparkline([4,13,8,15,2,3,8,6,6,3], $.extend(slOptionsUniques, {chartRangeMax: 23}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag uz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Uzbekistan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="UZ" href="#coll62">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    269                                </td>
                                <td>160</td>
                                <td>
                                    1.68                                </td>
                                <td> <span id="cb_UZ"></span></td>
                                <td>3 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_UZ').sparkline([18,4,2,2,6,10,7,4,5,3], $.extend(slOptions, {chartRangeMax: 18}))
                                    .sparkline([7,2,2,2,5,8,7,3,3,3], $.extend(slOptionsUniques, {chartRangeMax: 18}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lv" style="margin-right: 5px; float: left;"></span> <span class="vstor">Latvia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LV" href="#coll63">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    258                                </td>
                                <td>227</td>
                                <td>
                                    1.14                                </td>
                                <td> <span id="cb_LV"></span></td>
                                <td>17 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LV').sparkline([7,7,9,3,7,7,23,2,6,6], $.extend(slOptions, {chartRangeMax: 23}))
                                    .sparkline([7,5,9,3,7,3,12,2,6,6], $.extend(slOptionsUniques, {chartRangeMax: 23}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag am" style="margin-right: 5px; float: left;"></span> <span class="vstor">Armenia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AM" href="#coll64">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    242                                </td>
                                <td>71</td>
                                <td>
                                    3.41                                </td>
                                <td> <span id="cb_AM"></span></td>
                                <td>2 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AM').sparkline([11,22,16,11,12,9,5,7,10,12], $.extend(slOptions, {chartRangeMax: 22}))
                                    .sparkline([3,3,5,3,2,3,2,2,3,4], $.extend(slOptionsUniques, {chartRangeMax: 22}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag qa" style="margin-right: 5px; float: left;"></span> <span class="vstor">Qatar</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="QA" href="#coll65">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    233                                </td>
                                <td>95</td>
                                <td>
                                    2.45                                </td>
                                <td> <span id="cb_QA"></span></td>
                                <td>3 hours ago  from Doha, Baladiyat ad Dawhah</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_QA').sparkline([7,9,11,3,3,7,10,4,11,4], $.extend(slOptions, {chartRangeMax: 11}))
                                    .sparkline([2,2,4,2,2,2,4,2,3,1], $.extend(slOptionsUniques, {chartRangeMax: 11}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bh" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bahrain</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BH" href="#coll66">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    227                                </td>
                                <td>59</td>
                                <td>
                                    3.85                                </td>
                                <td> <span id="cb_BH"></span></td>
                                <td>11 hours ago  from Manama, Manama</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BH').sparkline([4,6,11,1,9,8,19,6,3,4], $.extend(slOptions, {chartRangeMax: 19}))
                                    .sparkline([3,4,3,1,3,4,3,2,2,1], $.extend(slOptionsUniques, {chartRangeMax: 19}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag kg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Kyrgyzstan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="KG" href="#coll67">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    217                                </td>
                                <td>174</td>
                                <td>
                                    1.25                                </td>
                                <td> <span id="cb_KG"></span></td>
                                <td>22 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KG').sparkline([6,14,15,20,10,4,6,5,7,7], $.extend(slOptions, {chartRangeMax: 20}))
                                    .sparkline([3,10,11,15,8,4,5,4,6,7], $.extend(slOptionsUniques, {chartRangeMax: 20}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ve" style="margin-right: 5px; float: left;"></span> <span class="vstor">Venezuela</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="VE" href="#coll68">20 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    213                                </td>
                                <td>108</td>
                                <td>
                                    1.97                                </td>
                                <td> <span id="cb_VE"></span></td>
                                <td>15 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_VE').sparkline([6,8,12,9,4,7,7,5,5,0], $.extend(slOptions, {chartRangeMax: 12}))
                                    .sparkline([5,5,5,6,2,4,4,4,3,0], $.extend(slOptionsUniques, {chartRangeMax: 12}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag my" style="margin-right: 5px; float: left;"></span> <span class="vstor">Malaysia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MY" href="#coll69">26 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    210                                </td>
                                <td>141</td>
                                <td>
                                    1.49                                </td>
                                <td> <span id="cb_MY"></span></td>
                                <td>2 hours ago  from Kuala Lumpur, Kuala Lumpur</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MY').sparkline([9,2,3,4,7,11,8,4,14,3], $.extend(slOptions, {chartRangeMax: 14}))
                                    .sparkline([5,2,2,4,3,6,5,4,5,3], $.extend(slOptionsUniques, {chartRangeMax: 14}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sv" style="margin-right: 5px; float: left;"></span> <span class="vstor">El Salvador</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SV" href="#coll70">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    208                                </td>
                                <td>75</td>
                                <td>
                                    2.77                                </td>
                                <td> <span id="cb_SV"></span></td>
                                <td>19 minutes ago  from San Salvador, Departamento de San Salvador</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SV').sparkline([7,3,5,3,0,5,8,1,0,7], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([4,3,3,3,0,4,3,1,0,2], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag by" style="margin-right: 5px; float: left;"></span> <span class="vstor">Belarus</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BY" href="#coll71">10 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    190                                </td>
                                <td>119</td>
                                <td>
                                    1.6                                </td>
                                <td> <span id="cb_BY"></span></td>
                                <td>40 minutes ago  from Minsk, Minsk</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BY').sparkline([16,5,11,8,6,11,7,11,10,6], $.extend(slOptions, {chartRangeMax: 16}))
                                    .sparkline([8,3,7,3,3,5,4,9,5,3], $.extend(slOptionsUniques, {chartRangeMax: 16}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag hr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Croatia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="HR" href="#coll72">26 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    188                                </td>
                                <td>125</td>
                                <td>
                                    1.5                                </td>
                                <td> <span id="cb_HR"></span></td>
                                <td>4 hours ago  from Zagreb, Grad Zagreb</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_HR').sparkline([12,7,5,13,6,2,6,4,9,3], $.extend(slOptions, {chartRangeMax: 13}))
                                    .sparkline([4,6,4,8,3,2,5,4,6,3], $.extend(slOptionsUniques, {chartRangeMax: 13}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag do" style="margin-right: 5px; float: left;"></span> <span class="vstor">Dominican Republic</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="DO" href="#coll73">8 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    188                                </td>
                                <td>73</td>
                                <td>
                                    2.58                                </td>
                                <td> <span id="cb_DO"></span></td>
                                <td>18 hours ago  from Altamira, "Puerto Plata"</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_DO').sparkline([5,8,4,2,8,9,5,2,8,0], $.extend(slOptions, {chartRangeMax: 9}))
                                    .sparkline([4,3,4,2,4,4,5,2,4,0], $.extend(slOptionsUniques, {chartRangeMax: 9}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gh" style="margin-right: 5px; float: left;"></span> <span class="vstor">Ghana</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GH" href="#coll74">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    171                                </td>
                                <td>111</td>
                                <td>
                                    1.54                                </td>
                                <td> <span id="cb_GH"></span></td>
                                <td>5 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GH').sparkline([5,3,7,7,12,8,10,4,10,4], $.extend(slOptions, {chartRangeMax: 12}))
                                    .sparkline([3,1,5,5,7,7,3,3,8,2], $.extend(slOptionsUniques, {chartRangeMax: 12}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Tanzania</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TZ" href="#coll75">13 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    165                                </td>
                                <td>103</td>
                                <td>
                                    1.6                                </td>
                                <td> <span id="cb_TZ"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TZ').sparkline([1,9,5,2,6,6,3,5,2,5], $.extend(slOptions, {chartRangeMax: 9}))
                                    .sparkline([1,5,4,2,3,3,2,3,1,3], $.extend(slOptionsUniques, {chartRangeMax: 9}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ke" style="margin-right: 5px; float: left;"></span> <span class="vstor">Kenya</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="KE" href="#coll76">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    158                                </td>
                                <td>111</td>
                                <td>
                                    1.42                                </td>
                                <td> <span id="cb_KE"></span></td>
                                <td>5 hours ago  from Nairobi, Nairobi Province</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KE').sparkline([2,4,15,10,2,5,10,9,7,5], $.extend(slOptions, {chartRangeMax: 15}))
                                    .sparkline([2,3,10,7,2,2,7,8,4,3], $.extend(slOptionsUniques, {chartRangeMax: 15}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sy" style="margin-right: 5px; float: left;"></span> <span class="vstor">Syria</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SY" href="#coll77">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    150                                </td>
                                <td>73</td>
                                <td>
                                    2.05                                </td>
                                <td> <span id="cb_SY"></span></td>
                                <td>19 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SY').sparkline([2,2,4,1,0,7,4,4,5,0], $.extend(slOptions, {chartRangeMax: 7}))
                                    .sparkline([2,1,3,1,0,3,1,4,3,0], $.extend(slOptionsUniques, {chartRangeMax: 7}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ma" style="margin-right: 5px; float: left;"></span> <span class="vstor">Morocco</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MA" href="#coll78">18 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    142                                </td>
                                <td>103</td>
                                <td>
                                    1.38                                </td>
                                <td> <span id="cb_MA"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MA').sparkline([3,6,2,3,2,6,6,1,2,1], $.extend(slOptions, {chartRangeMax: 6}))
                                    .sparkline([3,3,1,3,2,5,4,1,2,1], $.extend(slOptionsUniques, {chartRangeMax: 6}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag kh" style="margin-right: 5px; float: left;"></span> <span class="vstor">Cambodia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="KH" href="#coll79">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    140                                </td>
                                <td>58</td>
                                <td>
                                    2.41                                </td>
                                <td> <span id="cb_KH"></span></td>
                                <td>7 hours ago  from Phnom Penh, Phnom Penh</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KH').sparkline([4,1,0,4,1,2,0,1,6,2], $.extend(slOptions, {chartRangeMax: 6}))
                                    .sparkline([2,1,0,3,1,1,0,1,4,2], $.extend(slOptionsUniques, {chartRangeMax: 6}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ec" style="margin-right: 5px; float: left;"></span> <span class="vstor">Ecuador</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="EC" href="#coll80">17 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    134                                </td>
                                <td>89</td>
                                <td>
                                    1.51                                </td>
                                <td> <span id="cb_EC"></span></td>
                                <td>18 hours ago  from Loja, Provincia de Loja</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_EC').sparkline([6,3,1,5,10,3,5,4,3,0], $.extend(slOptions, {chartRangeMax: 10}))
                                    .sparkline([3,3,1,5,7,3,5,3,3,0], $.extend(slOptionsUniques, {chartRangeMax: 10}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Costa Rica</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CR" href="#coll81">10 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    130                                </td>
                                <td>70</td>
                                <td>
                                    1.86                                </td>
                                <td> <span id="cb_CR"></span></td>
                                <td>9 hours ago  from San José, Provincia de San Jose</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CR').sparkline([15,3,2,4,2,2,3,3,2,2], $.extend(slOptions, {chartRangeMax: 15}))
                                    .sparkline([5,1,2,2,1,2,2,2,2,1], $.extend(slOptionsUniques, {chartRangeMax: 15}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag iq" style="margin-right: 5px; float: left;"></span> <span class="vstor">Iraq</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IQ" href="#coll82">9 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    127                                </td>
                                <td>96</td>
                                <td>
                                    1.32                                </td>
                                <td> <span id="cb_IQ"></span></td>
                                <td>6 hours ago  from Karbala, Muhafazat Karbala'</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IQ').sparkline([3,4,8,2,3,3,2,4,2,1], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([2,3,6,1,3,2,2,3,1,1], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lk" style="margin-right: 5px; float: left;"></span> <span class="vstor">Sri Lanka</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LK" href="#coll83">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    124                                </td>
                                <td>68</td>
                                <td>
                                    1.82                                </td>
                                <td> <span id="cb_LK"></span></td>
                                <td>1 day ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LK').sparkline([4,1,3,0,0,2,1,4,1,0], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([1,1,3,0,0,1,1,2,1,0], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag dz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Algeria</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="DZ" href="#coll84">18 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    106                                </td>
                                <td>77</td>
                                <td>
                                    1.38                                </td>
                                <td> <span id="cb_DZ"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_DZ').sparkline([0,2,1,3,1,1,4,5,2,3], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([0,2,1,3,1,1,3,3,2,3], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag az" style="margin-right: 5px; float: left;"></span> <span class="vstor">Azerbaijan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AZ" href="#coll85">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    102                                </td>
                                <td>73</td>
                                <td>
                                    1.4                                </td>
                                <td> <span id="cb_AZ"></span></td>
                                <td>52 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AZ').sparkline([3,4,2,3,4,20,2,3,6,4], $.extend(slOptions, {chartRangeMax: 20}))
                                    .sparkline([3,4,2,3,3,4,2,3,5,3], $.extend(slOptionsUniques, {chartRangeMax: 20}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag al" style="margin-right: 5px; float: left;"></span> <span class="vstor">Albania</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AL" href="#coll86">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    97                                </td>
                                <td>36</td>
                                <td>
                                    2.69                                </td>
                                <td> <span id="cb_AL"></span></td>
                                <td>8 hours ago  from Tirana, Qarku i Tiranes</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AL').sparkline([3,4,4,4,3,3,3,2,3,3], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([1,2,3,2,1,1,1,1,1,1], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gt" style="margin-right: 5px; float: left;"></span> <span class="vstor">Guatemala</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GT" href="#coll87">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    95                                </td>
                                <td>56</td>
                                <td>
                                    1.7                                </td>
                                <td> <span id="cb_GT"></span></td>
                                <td>2 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GT').sparkline([1,1,7,2,1,8,7,5,0,0], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([1,1,3,1,1,4,5,2,0,0], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ps" style="margin-right: 5px; float: left;"></span> <span class="vstor">Palestine</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PS" href="#coll88">5 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    93                                </td>
                                <td>38</td>
                                <td>
                                    2.45                                </td>
                                <td> <span id="cb_PS"></span></td>
                                <td>46 minutes ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PS').sparkline([6,1,1,0,0,2,2,0,3,3], $.extend(slOptions, {chartRangeMax: 6}))
                                    .sparkline([1,1,1,0,0,2,2,0,2,1], $.extend(slOptionsUniques, {chartRangeMax: 6}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag si" style="margin-right: 5px; float: left;"></span> <span class="vstor">Slovenia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SI" href="#coll89">15 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    90                                </td>
                                <td>53</td>
                                <td>
                                    1.7                                </td>
                                <td> <span id="cb_SI"></span></td>
                                <td>1 day ago  from Postojna, Postojna</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SI').sparkline([4,14,2,0,5,7,1,0,4,0], $.extend(slOptions, {chartRangeMax: 14}))
                                    .sparkline([1,5,2,0,5,3,1,0,2,0], $.extend(slOptionsUniques, {chartRangeMax: 14}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Puerto Rico</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PR" href="#coll90">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    88                                </td>
                                <td>67</td>
                                <td>
                                    1.31                                </td>
                                <td> <span id="cb_PR"></span></td>
                                <td>12 hours ago  from Toa Baja, Toa Baja Municipio</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PR').sparkline([4,10,5,1,2,2,1,0,1,3], $.extend(slOptions, {chartRangeMax: 10}))
                                    .sparkline([2,5,3,1,2,2,1,0,1,2], $.extend(slOptionsUniques, {chartRangeMax: 10}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cy" style="margin-right: 5px; float: left;"></span> <span class="vstor">Cyprus</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CY" href="#coll91">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    86                                </td>
                                <td>45</td>
                                <td>
                                    1.91                                </td>
                                <td> <span id="cb_CY"></span></td>
                                <td>1 hour ago  from Limassol, Limassol</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CY').sparkline([7,16,0,0,1,1,1,5,0,1], $.extend(slOptions, {chartRangeMax: 16}))
                                    .sparkline([6,3,0,0,1,1,1,2,0,1], $.extend(slOptionsUniques, {chartRangeMax: 16}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ge" style="margin-right: 5px; float: left;"></span> <span class="vstor">Georgia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GE" href="#coll92">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    81                                </td>
                                <td>56</td>
                                <td>
                                    1.45                                </td>
                                <td> <span id="cb_GE"></span></td>
                                <td>3 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GE').sparkline([3,2,7,7,0,2,3,5,2,1], $.extend(slOptions, {chartRangeMax: 7}))
                                    .sparkline([2,2,5,4,0,2,1,3,2,1], $.extend(slOptionsUniques, {chartRangeMax: 7}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Myanmar [Burma]</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MM" href="#coll93">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    81                                </td>
                                <td>46</td>
                                <td>
                                    1.76                                </td>
                                <td> <span id="cb_MM"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MM').sparkline([1,0,0,0,1,1,15,16,11,5], $.extend(slOptions, {chartRangeMax: 16}))
                                    .sparkline([1,0,0,0,1,1,4,8,2,4], $.extend(slOptionsUniques, {chartRangeMax: 16}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag md" style="margin-right: 5px; float: left;"></span> <span class="vstor">Republic of Moldova</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MD" href="#coll94">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    78                                </td>
                                <td>60</td>
                                <td>
                                    1.3                                </td>
                                <td> <span id="cb_MD"></span></td>
                                <td>4 hours ago  from Chişinău, Municipiul Chisinau</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MD').sparkline([5,0,3,4,3,2,1,1,2,1], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([2,0,3,3,3,2,1,1,2,1], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag py" style="margin-right: 5px; float: left;"></span> <span class="vstor">Paraguay</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PY" href="#coll95">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    78                                </td>
                                <td>55</td>
                                <td>
                                    1.42                                </td>
                                <td> <span id="cb_PY"></span></td>
                                <td>15 hours ago  from Asunción, Asuncion</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PY').sparkline([1,0,2,2,0,0,2,4,5,1], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([1,0,2,2,0,0,2,3,4,1], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag jm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Jamaica</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="JM" href="#coll96">10 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    77                                </td>
                                <td>52</td>
                                <td>
                                    1.48                                </td>
                                <td> <span id="cb_JM"></span></td>
                                <td>19 hours ago  from Kingston, Kingston</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_JM').sparkline([1,3,0,6,5,6,2,6,3,0], $.extend(slOptions, {chartRangeMax: 6}))
                                    .sparkline([1,2,0,2,3,2,2,5,2,0], $.extend(slOptionsUniques, {chartRangeMax: 6}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag uy" style="margin-right: 5px; float: left;"></span> <span class="vstor">Uruguay</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="UY" href="#coll97">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    69                                </td>
                                <td>36</td>
                                <td>
                                    1.92                                </td>
                                <td> <span id="cb_UY"></span></td>
                                <td>39 minutes ago  from Montevideo, Departamento de Montevideo</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_UY').sparkline([1,0,0,1,0,1,4,1,0,3], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([1,0,0,1,0,1,3,1,0,2], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag rs" style="margin-right: 5px; float: left;"></span> <span class="vstor">Serbia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="RS" href="#coll98">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    65                                </td>
                                <td>53</td>
                                <td>
                                    1.23                                </td>
                                <td> <span id="cb_RS"></span></td>
                                <td>19 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_RS').sparkline([3,1,2,2,4,5,4,5,4,0], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([3,1,2,2,4,4,4,3,3,0], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag hn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Honduras</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="HN" href="#coll99">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    63                                </td>
                                <td>39</td>
                                <td>
                                    1.62                                </td>
                                <td> <span id="cb_HN"></span></td>
                                <td>5 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_HN').sparkline([6,8,8,0,3,0,1,4,4,2], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([2,5,5,0,1,0,1,3,2,1], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ly" style="margin-right: 5px; float: left;"></span> <span class="vstor">Libya</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LY" href="#coll100">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    61                                </td>
                                <td>41</td>
                                <td>
                                    1.49                                </td>
                                <td> <span id="cb_LY"></span></td>
                                <td>48 minutes ago  from Tripoli, Tripoli</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LY').sparkline([1,3,1,1,1,0,0,0,2,4], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([1,3,1,1,1,0,0,0,2,4], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mo" style="margin-right: 5px; float: left;"></span> <span class="vstor">Macao</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MO" href="#coll101">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    59                                </td>
                                <td>39</td>
                                <td>
                                    1.51                                </td>
                                <td> <span id="cb_MO"></span></td>
                                <td>11 hours ago  from Macao</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MO').sparkline([2,2,0,4,1,0,6,4,0,1], $.extend(slOptions, {chartRangeMax: 6}))
                                    .sparkline([1,1,0,4,1,0,2,2,0,1], $.extend(slOptionsUniques, {chartRangeMax: 6}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ci" style="margin-right: 5px; float: left;"></span> <span class="vstor">Ivory Coast</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CI" href="#coll102">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    54                                </td>
                                <td>44</td>
                                <td>
                                    1.23                                </td>
                                <td> <span id="cb_CI"></span></td>
                                <td>1 day ago  from Abidjan, Lagunes</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CI').sparkline([3,1,3,4,1,1,2,1,2,0], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([3,1,2,2,1,1,2,1,2,0], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag jo" style="margin-right: 5px; float: left;"></span> <span class="vstor">Hashemite Kingdom of Jordan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="JO" href="#coll103">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    54                                </td>
                                <td>29</td>
                                <td>
                                    1.86                                </td>
                                <td> <span id="cb_JO"></span></td>
                                <td>2 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_JO').sparkline([8,2,5,0,1,1,0,1,0,1], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([1,1,2,0,1,1,0,1,0,1], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ug" style="margin-right: 5px; float: left;"></span> <span class="vstor">Uganda</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="UG" href="#coll104">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    43                                </td>
                                <td>37</td>
                                <td>
                                    1.16                                </td>
                                <td> <span id="cb_UG"></span></td>
                                <td>3 hours ago  from Kampala, Central Region</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_UG').sparkline([1,1,0,1,0,2,2,3,1,2], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([1,1,0,1,0,1,2,3,1,1], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ao" style="margin-right: 5px; float: left;"></span> <span class="vstor">Angola</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AO" href="#coll105">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    43                                </td>
                                <td>27</td>
                                <td>
                                    1.59                                </td>
                                <td> <span id="cb_AO"></span></td>
                                <td>7 hours ago  from Luanda, Luanda Province</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AO').sparkline([1,2,1,0,1,1,2,1,3,1], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([1,1,1,0,1,1,2,1,3,1], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bo" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bolivia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BO" href="#coll106">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    41                                </td>
                                <td>29</td>
                                <td>
                                    1.41                                </td>
                                <td> <span id="cb_BO"></span></td>
                                <td>20 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BO').sparkline([2,5,0,0,2,2,2,2,4,0], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([2,3,0,0,1,1,2,2,3,0], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ni" style="margin-right: 5px; float: left;"></span> <span class="vstor">Nicaragua</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NI" href="#coll107">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    41                                </td>
                                <td>29</td>
                                <td>
                                    1.41                                </td>
                                <td> <span id="cb_NI"></span></td>
                                <td>1 day ago  from Managua, Departamento de Managua</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NI').sparkline([4,3,2,1,3,4,0,3,1,0], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([3,2,1,1,2,2,0,2,1,0], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pa" style="margin-right: 5px; float: left;"></span> <span class="vstor">Panama</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PA" href="#coll108">8 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    41                                </td>
                                <td>28</td>
                                <td>
                                    1.46                                </td>
                                <td> <span id="cb_PA"></span></td>
                                <td>3 days ago  from Panama City, Provincia de Panama</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PA').sparkline([1,0,4,5,0,0,2,0,0,0], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([1,0,2,2,0,0,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tj" style="margin-right: 5px; float: left;"></span> <span class="vstor">Tajikistan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TJ" href="#coll109">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    41                                </td>
                                <td>15</td>
                                <td>
                                    2.73                                </td>
                                <td> <span id="cb_TJ"></span></td>
                                <td>10 hours ago  from Vahdat, Republican Subordination</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TJ').sparkline([0,4,9,1,2,3,5,4,3,5], $.extend(slOptions, {chartRangeMax: 9}))
                                    .sparkline([0,1,2,1,1,1,1,1,1,1], $.extend(slOptionsUniques, {chartRangeMax: 9}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cu" style="margin-right: 5px; float: left;"></span> <span class="vstor">Cuba</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CU" href="#coll110">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    38                                </td>
                                <td>28</td>
                                <td>
                                    1.36                                </td>
                                <td> <span id="cb_CU"></span></td>
                                <td>1 hour ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CU').sparkline([2,0,1,2,0,1,0,0,1,2], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([2,0,1,2,0,1,0,0,1,2], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mk" style="margin-right: 5px; float: left;"></span> <span class="vstor">Macedonia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MK" href="#coll111">10 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    34                                </td>
                                <td>19</td>
                                <td>
                                    1.79                                </td>
                                <td> <span id="cb_MK"></span></td>
                                <td>2 days ago  from Resen, Resen</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MK').sparkline([2,3,2,1,3,0,1,0,0,0], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([1,3,2,1,2,0,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Tunisia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TN" href="#coll112">9 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    32                                </td>
                                <td>23</td>
                                <td>
                                    1.39                                </td>
                                <td> <span id="cb_TN"></span></td>
                                <td>21 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TN').sparkline([1,0,1,0,0,3,1,1,1,0], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([1,0,1,0,0,3,1,1,1,0], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Madagascar</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MG" href="#coll113">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    29                                </td>
                                <td>21</td>
                                <td>
                                    1.38                                </td>
                                <td> <span id="cb_MG"></span></td>
                                <td>1 day ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MG').sparkline([0,0,0,2,1,1,1,0,1,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,0,0,2,1,1,1,0,1,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag so" style="margin-right: 5px; float: left;"></span> <span class="vstor">Somalia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SO" href="#coll114">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    27                                </td>
                                <td>19</td>
                                <td>
                                    1.42                                </td>
                                <td> <span id="cb_SO"></span></td>
                                <td>2 days ago  from Mogadishu, Banaadir</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SO').sparkline([0,0,0,0,2,2,0,1,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,0,0,0,2,2,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ba" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bosnia and Herzegovina</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BA" href="#coll115">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    27                                </td>
                                <td>17</td>
                                <td>
                                    1.59                                </td>
                                <td> <span id="cb_BA"></span></td>
                                <td>1 day ago  from Doboj, Republika Srpska</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BA').sparkline([4,4,0,0,1,0,4,5,1,0], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([2,2,0,0,1,0,2,2,1,0], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag is" style="margin-right: 5px; float: left;"></span> <span class="vstor">Iceland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="IS" href="#coll116">7 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    25                                </td>
                                <td>18</td>
                                <td>
                                    1.39                                </td>
                                <td> <span id="cb_IS"></span></td>
                                <td>1 day ago  from Reykjavik, Capital Region</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_IS').sparkline([1,0,0,0,0,0,0,1,1,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([1,0,0,0,0,0,0,1,1,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lu" style="margin-right: 5px; float: left;"></span> <span class="vstor">Luxembourg</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LU" href="#coll117">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    24                                </td>
                                <td>13</td>
                                <td>
                                    1.85                                </td>
                                <td> <span id="cb_LU"></span></td>
                                <td>18 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LU').sparkline([0,0,0,0,0,0,1,8,2,0], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([0,0,0,0,0,0,1,2,1,0], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag af" style="margin-right: 5px; float: left;"></span> <span class="vstor">Afghanistan</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AF" href="#coll118">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    24                                </td>
                                <td>12</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_AF"></span></td>
                                <td>3 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AF').sparkline([4,0,8,2,0,0,7,0,0,0], $.extend(slOptions, {chartRangeMax: 8}))
                                    .sparkline([2,0,2,1,0,0,4,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 8}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lb" style="margin-right: 5px; float: left;"></span> <span class="vstor">Lebanon</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LB" href="#coll119">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    23                                </td>
                                <td>20</td>
                                <td>
                                    1.15                                </td>
                                <td> <span id="cb_LB"></span></td>
                                <td>9 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LB').sparkline([0,0,3,1,0,0,0,1,1,2], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([0,0,3,1,0,0,0,1,1,2], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Cameroon</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CM" href="#coll120">5 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    21                                </td>
                                <td>20</td>
                                <td>
                                    1.05                                </td>
                                <td> <span id="cb_CM"></span></td>
                                <td>6 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CM').sparkline([0,0,0,0,1,4,1,1,1,1], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([0,0,0,0,1,3,1,1,1,1], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag la" style="margin-right: 5px; float: left;"></span> <span class="vstor">Laos</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="LA" href="#coll121">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    21                                </td>
                                <td>11</td>
                                <td>
                                    1.91                                </td>
                                <td> <span id="cb_LA"></span></td>
                                <td>4 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LA').sparkline([0,0,0,0,0,1,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,1,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag li" style="margin-right: 5px; float: left;"></span> <span class="vstor">Liechtenstein</span>
                                </td>
                                <td>
                                                                            Vaduz                                                                    </td>
                                <td>
                                    20                                </td>
                                <td>8</td>
                                <td>
                                    2.5                                </td>
                                <td> <span id="cb_LI"></span></td>
                                <td>2 days ago  from Vaduz, Vaduz</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LI').sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Gambia</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    20                                </td>
                                <td>7</td>
                                <td>
                                    2.86                                </td>
                                <td> <span id="cb_GM"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GM').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Mozambique</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MZ" href="#coll124">4 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    19                                </td>
                                <td>17</td>
                                <td>
                                    1.12                                </td>
                                <td> <span id="cb_MZ"></span></td>
                                <td>1 hour ago  from Mozambique, Nampula</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MZ').sparkline([0,2,0,1,1,0,0,0,0,1], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,2,0,1,1,0,0,0,0,1], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag zm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Zambia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ZM" href="#coll125">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    19                                </td>
                                <td>17</td>
                                <td>
                                    1.12                                </td>
                                <td> <span id="cb_ZM"></span></td>
                                <td>2 days ago  from Lusaka, Lusaka Province</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ZM').sparkline([2,1,1,1,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([2,1,1,1,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cd" style="margin-right: 5px; float: left;"></span> <span class="vstor">Congo</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CD" href="#coll126">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    19                                </td>
                                <td>12</td>
                                <td>
                                    1.58                                </td>
                                <td> <span id="cb_CD"></span></td>
                                <td>2 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CD').sparkline([0,0,1,1,1,0,1,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,1,1,1,0,1,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag rw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Rwanda</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    18                                </td>
                                <td>13</td>
                                <td>
                                    1.38                                </td>
                                <td> <span id="cb_RW"></span></td>
                                <td>5 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_RW').sparkline([0,0,0,1,1,1,0,0,1,1], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,1,1,1,0,0,1,1], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Palau</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    18                                </td>
                                <td>5</td>
                                <td>
                                    3.6                                </td>
                                <td> <span id="cb_PW"></span></td>
                                <td>3 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PW').sparkline([0,0,1,3,5,3,6,0,0,0], $.extend(slOptions, {chartRangeMax: 6}))
                                    .sparkline([0,0,1,1,1,1,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 6}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ye" style="margin-right: 5px; float: left;"></span> <span class="vstor">Yemen</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="YE" href="#coll129">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    14                                </td>
                                <td>8</td>
                                <td>
                                    1.75                                </td>
                                <td> <span id="cb_YE"></span></td>
                                <td>2 days ago  from Sanaa, Sanaa</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_YE').sparkline([0,0,0,0,0,3,7,0,0,0], $.extend(slOptions, {chartRangeMax: 7}))
                                    .sparkline([0,0,0,0,0,2,2,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 7}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag aw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Aruba</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AW" href="#coll130">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    13                                </td>
                                <td>7</td>
                                <td>
                                    1.86                                </td>
                                <td> <span id="cb_AW"></span></td>
                                <td>7 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AW').sparkline([5,0,3,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 5}))
                                    .sparkline([1,0,2,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 5}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Papua New Guinea</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PG" href="#coll131">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    12                                </td>
                                <td>10</td>
                                <td>
                                    1.2                                </td>
                                <td> <span id="cb_PG"></span></td>
                                <td>3 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PG').sparkline([0,0,0,4,0,0,1,0,0,0], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([0,0,0,3,0,0,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ml" style="margin-right: 5px; float: left;"></span> <span class="vstor">Mali</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ML" href="#coll132">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    12                                </td>
                                <td>10</td>
                                <td>
                                    1.2                                </td>
                                <td> <span id="cb_ML"></span></td>
                                <td>13 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ML').sparkline([0,2,0,0,0,0,0,0,1,1], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,2,0,0,0,0,0,0,1,1], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ht" style="margin-right: 5px; float: left;"></span> <span class="vstor">Haiti</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="HT" href="#coll133">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    12                                </td>
                                <td>8</td>
                                <td>
                                    1.5                                </td>
                                <td> <span id="cb_HT"></span></td>
                                <td>1 day ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_HT').sparkline([0,0,0,1,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,1,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mu" style="margin-right: 5px; float: left;"></span> <span class="vstor">Mauritius</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    11                                </td>
                                <td>9</td>
                                <td>
                                    1.22                                </td>
                                <td> <span id="cb_MU"></span></td>
                                <td>19 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MU').sparkline([0,1,1,0,0,0,0,0,1,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,1,1,0,0,0,0,0,1,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Brunei</span>
                                </td>
                                <td>
                                                                            Bandar Seri Begawan                                                                    </td>
                                <td>
                                    11                                </td>
                                <td>4</td>
                                <td>
                                    2.75                                </td>
                                <td> <span id="cb_BN"></span></td>
                                <td>9 days ago  from Bandar Seri Begawan, Brunei and Muara District</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BN').sparkline([1,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([1,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Malawi</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    10                                </td>
                                <td>10</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_MW"></span></td>
                                <td>3 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MW').sparkline([0,2,0,0,1,0,1,0,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,2,0,0,1,0,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tt" style="margin-right: 5px; float: left;"></span> <span class="vstor">Trinidad and Tobago</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TT" href="#coll137">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    10                                </td>
                                <td>9</td>
                                <td>
                                    1.11                                </td>
                                <td> <span id="cb_TT"></span></td>
                                <td>1 day ago  from Chaguanas, Chaguanas</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TT').sparkline([0,0,0,0,1,0,0,0,1,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,1,0,0,0,1,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag kw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Kuwait</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="KW" href="#coll138">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    10                                </td>
                                <td>9</td>
                                <td>
                                    1.11                                </td>
                                <td> <span id="cb_KW"></span></td>
                                <td>2 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KW').sparkline([3,0,0,0,0,0,0,2,0,0], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([2,0,0,0,0,0,0,2,0,0], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag om" style="margin-right: 5px; float: left;"></span> <span class="vstor">Oman</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="OM" href="#coll139">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    10                                </td>
                                <td>8</td>
                                <td>
                                    1.25                                </td>
                                <td> <span id="cb_OM"></span></td>
                                <td>1 day ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_OM').sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Mongolia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MN" href="#coll140">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    10                                </td>
                                <td>8</td>
                                <td>
                                    1.25                                </td>
                                <td> <span id="cb_MN"></span></td>
                                <td>5 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MN').sparkline([0,2,0,0,1,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,1,0,0,1,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mt" style="margin-right: 5px; float: left;"></span> <span class="vstor">Malta</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MT" href="#coll141">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    10                                </td>
                                <td>7</td>
                                <td>
                                    1.43                                </td>
                                <td> <span id="cb_MT"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MT').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Senegal</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SN" href="#coll142">3 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    9                                </td>
                                <td>8</td>
                                <td>
                                    1.13                                </td>
                                <td> <span id="cb_SN"></span></td>
                                <td>3 days ago  from Dakar, Dakar</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SN').sparkline([0,0,0,1,0,3,0,0,0,0], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([0,0,0,1,0,2,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag dm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Dominica</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="DM" href="#coll143">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    9                                </td>
                                <td>5</td>
                                <td>
                                    1.8                                </td>
                                <td> <span id="cb_DM"></span></td>
                                <td>6 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_DM').sparkline([1,0,0,1,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([1,0,0,1,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag fj" style="margin-right: 5px; float: left;"></span> <span class="vstor">Fiji</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="FJ" href="#coll144">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    8                                </td>
                                <td>7</td>
                                <td>
                                    1.14                                </td>
                                <td> <span id="cb_FJ"></span></td>
                                <td>3 days ago  from Suva, Central</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_FJ').sparkline([0,0,0,0,0,1,1,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,1,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bb" style="margin-right: 5px; float: left;"></span> <span class="vstor">Barbados</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    8                                </td>
                                <td>6</td>
                                <td>
                                    1.33                                </td>
                                <td> <span id="cb_BB"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BB').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Togo</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TG" href="#coll146">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    8                                </td>
                                <td>4</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_TG"></span></td>
                                <td>7 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TG').sparkline([0,0,4,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 4}))
                                    .sparkline([0,0,1,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 4}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bs" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bahamas</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BS" href="#coll147">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    8                                </td>
                                <td>4</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_BS"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BS').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mq" style="margin-right: 5px; float: left;"></span> <span class="vstor">Martinique</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MQ" href="#coll148">6 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    7                                </td>
                                <td>6</td>
                                <td>
                                    1.17                                </td>
                                <td> <span id="cb_MQ"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MQ').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mv" style="margin-right: 5px; float: left;"></span> <span class="vstor">Maldives</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="MV" href="#coll149">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6                                </td>
                                <td>5</td>
                                <td>
                                    1.2                                </td>
                                <td> <span id="cb_MV"></span></td>
                                <td>1 day ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MV').sparkline([0,0,0,0,0,1,1,0,3,0], $.extend(slOptions, {chartRangeMax: 3}))
                                    .sparkline([0,0,0,0,0,1,1,0,2,0], $.extend(slOptionsUniques, {chartRangeMax: 3}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag zw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Zimbabwe</span>
                                </td>
                                <td>
                                                                            Harare                                                                    </td>
                                <td>
                                    6                                </td>
                                <td>5</td>
                                <td>
                                    1.2                                </td>
                                <td> <span id="cb_ZW"></span></td>
                                <td>1 day ago  from Harare, Harare</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ZW').sparkline([1,0,0,0,0,0,0,0,2,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([1,0,0,0,0,0,0,0,1,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sb" style="margin-right: 5px; float: left;"></span> <span class="vstor">Solomon Islands</span>
                                </td>
                                <td>
                                                                            Honiara                                                                    </td>
                                <td>
                                    6                                </td>
                                <td>5</td>
                                <td>
                                    1.2                                </td>
                                <td> <span id="cb_SB"></span></td>
                                <td>6 days ago  from Honiara, Guadalcanal Province</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SB').sparkline([1,0,0,2,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([1,0,0,1,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sl" style="margin-right: 5px; float: left;"></span> <span class="vstor">Sierra Leone</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    6                                </td>
                                <td>5</td>
                                <td>
                                    1.2                                </td>
                                <td> <span id="cb_SL"></span></td>
                                <td>1 day ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SL').sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sx" style="margin-right: 5px; float: left;"></span> <span class="vstor">Sint Maarten</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SX" href="#coll153">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6                                </td>
                                <td>3</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_SX"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SX').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag pf" style="margin-right: 5px; float: left;"></span> <span class="vstor">French Polynesia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="PF" href="#coll154">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    6                                </td>
                                <td>3</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_PF"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_PF').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Suriname</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    6                                </td>
                                <td>2</td>
                                <td>
                                    3                                </td>
                                <td> <span id="cb_SR"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SR').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Belize</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BZ" href="#coll156">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    5                                </td>
                                <td>4</td>
                                <td>
                                    1.25                                </td>
                                <td> <span id="cb_BZ"></span></td>
                                <td>2 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BZ').sparkline([0,0,0,1,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,1,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag re" style="margin-right: 5px; float: left;"></span> <span class="vstor">Réunion</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="RE" href="#coll157">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    5                                </td>
                                <td>3</td>
                                <td>
                                    1.67                                </td>
                                <td> <span id="cb_RE"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_RE').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sz" style="margin-right: 5px; float: left;"></span> <span class="vstor">Swaziland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SZ" href="#coll158">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4                                </td>
                                <td>4</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_SZ"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SZ').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sc" style="margin-right: 5px; float: left;"></span> <span class="vstor">Seychelles</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="SC" href="#coll159">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4                                </td>
                                <td>4</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_SC"></span></td>
                                <td>4 days ago  from "Anse aux Pins"</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SC').sparkline([0,0,1,0,1,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,1,0,1,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bf" style="margin-right: 5px; float: left;"></span> <span class="vstor">Burkina Faso</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BF" href="#coll160">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4                                </td>
                                <td>4</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_BF"></span></td>
                                <td>3 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BF').sparkline([1,0,0,0,0,1,1,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([1,0,0,0,0,1,1,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag bm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Bermuda</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="BM" href="#coll161">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4                                </td>
                                <td>4</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_BM"></span></td>
                                <td>22 hours ago  from Hamilton, Hamilton city</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_BM').sparkline([0,0,0,0,0,0,0,1,2,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([0,0,0,0,0,0,0,1,2,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sd" style="margin-right: 5px; float: left;"></span> <span class="vstor">Sudan</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    4                                </td>
                                <td>4</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_SD"></span></td>
                                <td>5 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SD').sparkline([1,0,0,0,1,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([1,0,0,0,1,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag me" style="margin-right: 5px; float: left;"></span> <span class="vstor">Montenegro</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="ME" href="#coll163">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    4                                </td>
                                <td>3</td>
                                <td>
                                    1.33                                </td>
                                <td> <span id="cb_ME"></span></td>
                                <td>3 hours ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ME').sparkline([0,0,0,0,0,0,0,0,0,1], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,1], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lr" style="margin-right: 5px; float: left;"></span> <span class="vstor">Liberia</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    4                                </td>
                                <td>3</td>
                                <td>
                                    1.33                                </td>
                                <td> <span id="cb_LR"></span></td>
                                <td>7 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LR').sparkline([2,0,1,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([1,0,1,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gu" style="margin-right: 5px; float: left;"></span> <span class="vstor">Guam</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    4                                </td>
                                <td>1</td>
                                <td>
                                    4                                </td>
                                <td> <span id="cb_GU"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GU').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag td" style="margin-right: 5px; float: left;"></span> <span class="vstor">Chad</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TD" href="#coll166">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3                                </td>
                                <td>3</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_TD"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TD').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ga" style="margin-right: 5px; float: left;"></span> <span class="vstor">Gabon</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    3                                </td>
                                <td>3</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GA"></span></td>
                                <td>4 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GA').sparkline([0,0,0,1,0,1,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,1,0,1,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ky" style="margin-right: 5px; float: left;"></span> <span class="vstor">Cayman Islands</span>
                                </td>
                                <td>
                                                                            George Town                                                                    </td>
                                <td>
                                    3                                </td>
                                <td>3</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_KY"></span></td>
                                <td>1 day ago  from George Town</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KY').sparkline([0,0,0,0,0,0,0,0,1,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,1,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ax" style="margin-right: 5px; float: left;"></span> <span class="vstor">Åland</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AX" href="#coll169">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3                                </td>
                                <td>2</td>
                                <td>
                                    1.5                                </td>
                                <td> <span id="cb_AX"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AX').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Curaçao</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="CW" href="#coll170">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    3                                </td>
                                <td>2</td>
                                <td>
                                    1.5                                </td>
                                <td> <span id="cb_CW"></span></td>
                                <td>5 days ago  from Willemstad</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CW').sparkline([0,0,0,0,1,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,1,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag nc" style="margin-right: 5px; float: left;"></span> <span class="vstor">New Caledonia</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="NC" href="#coll171">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_NC"></span></td>
                                <td>8 days ago  from Noumea, South Province</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_NC').sparkline([0,1,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,1,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gy" style="margin-right: 5px; float: left;"></span> <span class="vstor">Guyana</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GY" href="#coll172">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GY"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GY').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gd" style="margin-right: 5px; float: left;"></span> <span class="vstor">Grenada</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="GD" href="#coll173">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GD"></span></td>
                                <td>5 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GD').sparkline([0,0,0,0,1,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,1,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tl" style="margin-right: 5px; float: left;"></span> <span class="vstor">East Timor</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="TL" href="#coll174">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_TL"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TL').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ad" style="margin-right: 5px; float: left;"></span> <span class="vstor">Andorra</span>
                                </td>
                                <td>
                                                                                                                        <a class="country-control text-nowrap" data-country="AD" href="#coll175">2 Locations <span class="caret"></span></a>
                                                                                                            </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_AD"></span></td>
                                <td>8 days ago  from Andorra la Vella, Andorra la Vella</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AD').sparkline([0,1,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,1,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tm" style="margin-right: 5px; float: left;"></span> <span class="vstor">Turkmenistan</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_TM"></span></td>
                                <td>7 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TM').sparkline([0,0,1,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,1,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ss" style="margin-right: 5px; float: left;"></span> <span class="vstor">South Sudan</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_SS"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SS').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag kn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Saint Kitts and Nevis</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_KN"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_KN').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag cg" style="margin-right: 5px; float: left;"></span> <span class="vstor">Republic of the Congo</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_CG"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_CG').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gn" style="margin-right: 5px; float: left;"></span> <span class="vstor">Guinea</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GN"></span></td>
                                <td>9 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GN').sparkline([1,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([1,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gq" style="margin-right: 5px; float: left;"></span> <span class="vstor">Equatorial Guinea</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>2</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GQ"></span></td>
                                <td>8 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GQ').sparkline([0,1,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,1,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag je" style="margin-right: 5px; float: left;"></span> <span class="vstor">Jersey</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>1</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_JE"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_JE').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ag" style="margin-right: 5px; float: left;"></span> <span class="vstor">Antigua and Barbuda</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    2                                </td>
                                <td>1</td>
                                <td>
                                    2                                </td>
                                <td> <span id="cb_AG"></span></td>
                                <td>9 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AG').sparkline([2,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 2}))
                                    .sparkline([1,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 2}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag va" style="margin-right: 5px; float: left;"></span> <span class="vstor">Vatican City</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_VA"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_VA').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag st" style="margin-right: 5px; float: left;"></span> <span class="vstor">São Tomé and Príncipe</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_ST"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ST').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag sj" style="margin-right: 5px; float: left;"></span> <span class="vstor">Svalbard and Jan Mayen</span>
                                </td>
                                <td>
                                                                            Sveagruva                                                                    </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_SJ"></span></td>
                                <td>17 hours ago  from Sveagruva, Svalbard</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_SJ').sparkline([0,0,0,0,0,0,0,0,1,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,1,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mf" style="margin-right: 5px; float: left;"></span> <span class="vstor">Saint Martin</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_MF"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MF').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag lc" style="margin-right: 5px; float: left;"></span> <span class="vstor">Saint Lucia</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_LC"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_LC').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mp" style="margin-right: 5px; float: left;"></span> <span class="vstor">Northern Mariana Islands</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_MP"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MP').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag mc" style="margin-right: 5px; float: left;"></span> <span class="vstor">Monaco</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_MC"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_MC').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gw" style="margin-right: 5px; float: left;"></span> <span class="vstor">Guinea-Bissau</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GW"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GW').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gp" style="margin-right: 5px; float: left;"></span> <span class="vstor">Guadeloupe</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GP"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GP').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gi" style="margin-right: 5px; float: left;"></span> <span class="vstor">Gibraltar</span>
                                </td>
                                <td>
                                                                            Gibraltar                                                                    </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GI"></span></td>
                                <td>2 days ago  from Gibraltar</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GI').sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,1,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag gf" style="margin-right: 5px; float: left;"></span> <span class="vstor">French Guiana</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_GF"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_GF').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag er" style="margin-right: 5px; float: left;"></span> <span class="vstor">Eritrea</span>
                                </td>
                                <td>
                                                                            Mendefera                                                                    </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_ER"></span></td>
                                <td>6 days ago  from Mendefera, Debub Region</td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_ER').sparkline([0,0,0,1,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,1,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag dj" style="margin-right: 5px; float: left;"></span> <span class="vstor">Djibouti</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_DJ"></span></td>
                                <td>5 days ago </td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_DJ').sparkline([0,0,0,0,1,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,1,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag ai" style="margin-right: 5px; float: left;"></span> <span class="vstor">Anguilla</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_AI"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_AI').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                                                    <tr class="sm2 hidden">
                                <td style="padding-left: 10px;">
                                    <span class="flag tc" style="margin-right: 5px; float: left;"></span> <span class="vstor">"Turks and Caicos Islands"</span>
                                </td>
                                <td>
                                                                                                                                                </td>
                                <td>
                                    1                                </td>
                                <td>1</td>
                                <td>
                                    1                                </td>
                                <td> <span id="cb_TC"></span></td>
                                <td></td>
                            </tr>

                            
                            
                        <script>
                                                        $('#cb_TC').sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptions, {chartRangeMax: 1}))
                                    .sparkline([0,0,0,0,0,0,0,0,0,0], $.extend(slOptionsUniques, {chartRangeMax: 1}));
                        </script>
                        
                    
                        

                </tbody>
            </table>
        </div>
    </div>
</div>


<script>

    $(document).ready(function () {

        var regionStyling = {initial: {fill: '#F5F5F6'}};

        $('#world-map-gdp').vectorMap({
            map: 'world_mill',
            zoomOnScroll: false,
            backgroundColor: "#FFFFFF",
            regionStyle: regionStyling,
            series: {
                regions: [{
                        values: gdpData,
                        scale: ['#dce4ef', '#658fca'],
                        normalizeFunction: 'polynomial',
                        attribute: 'fill'
                    }]
            },
            onRegionTipShow: function (e, el, code) {

                var visits = 0;

                if (code in gdpData) {
                    visits = gdpData[code];
                } else {
                    visits = 0;
                }

                el.html(el.html() + ' - ' + visits + ' visits');
            }
        });

    });

</script>
    </div>

<script type="text/javascript">
    $(function() {
        var loaded = false;
        $('.typeahead.search-header').click(function(e) {
            if ( loaded ) return;
            var $t = $(this);

            var scripts = ["/bl/js/search.min.js", "/bl/js/typeahead.min.js"];
            (function loader() {
                if (scripts.length == 0) {
                    loaded = true;
                    $t.focus();
                    return;
                }
                var url = scripts.pop();
                var s = document.createElement("script");
                s.onload = loader;
                s.src = url;
                document.head.appendChild(s);
            })();
        });
    });
</script>

    <script type="text/javascript" src="/assets/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="/assets/js/jquery.ihavecookies.min.js"></script>
    <style type="text/css">
        #gdpr-cookie-message {
            position: fixed;
            right: 15px;
            bottom: 30px;
            max-width: 375px;
            background-color: #f7f7f7;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 1px 1px rgba(0, 0, 0, 0.25);
            margin-left: 15px;
            font-family: system-ui;
            z-index: 9999;
        }

        #gdpr-cookie-message h4 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        #gdpr-cookie-message h5 {
            color: var(--red);
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 10px;
        }

        #gdpr-cookie-message p, #gdpr-cookie-message ul {
            color: black;
            font-size: 15px;
            line-height: 1.5em;
        }

        #gdpr-cookie-message p:last-child {
            margin-bottom: 0;
            text-align: right;
        }

        #gdpr-cookie-message li {
            width: 49%;
            display: inline-block;
        }

        #gdpr-cookie-message a {
            text-decoration: none;
            font-size: 15px;
            padding-bottom: 2px;
            border-bottom: 1px dotted rgba(255, 255, 255, 0.75);
            transition: all 0.3s ease-in;
        }

        #gdpr-cookie-message a:hover {
            color: black;
            border-bottom-color: var(--red);
            transition: all 0.3s ease-in;
        }

        #gdpr-cookie-message button {

            font-size: 15px;
            padding: 7px;
            border-radius: 3px;
            margin-left: 15px;
            cursor: pointer;
            transition: all 0.3s ease-in;
        }

        #gdpr-cookie-message button:hover {
            background: white;
            color: var(--red);
            transition: all 0.3s ease-in;
        }

        button#gdpr-cookie-advanced {
            background: black;
            color: var(--red);
        }

        #gdpr-cookie-message button:disabled {
            opacity: 0.3;
        }

        #gdpr-cookie-message input[type="checkbox"] {
            float: none;
            margin-top: 0;
            margin-right: 5px;
        }

        /*FOOTER*/
        .footer {
            padding-top: 28px !important;
            width: 100%;
            background-color: white;
            border-top: 1px solid rgb(235, 235, 235) !important;
        }

        .footer_header {
            font-size: 15px !important;
            color: rgb(72, 72, 72) !important;
            font-weight: 800 !important;
            padding-bottom: 20px;
        }

        .footer_link, footer_link:hover, footer_link:active {
            color: #767676 !important;
            font-size: 14px;
            font-weight: bold;
        }

        .footer_text {
            font-size: 15px;
            color: #767676;
        }

        .ltrsftr a {
            font-size: 16px;
            padding-right: 9px;
        }

    </style>


    <div class="container-fluid footc" style="border-top: 1px solid rgb(235, 235, 235) !important; margin-top: 40px;">
        <div class="container">
            <div class="row" style="margin-top: 20px; margin-bottom: 20px; padding-bottom: 20px; border-bottom: 1px solid rgb(235, 235, 235);">
                <div class="col-sm-12  col-md-3">
                    <div class="footer_header">ClustrMaps.com</div>
                    <div class="footer_text">ClustrMaps.com aggregates public records to analyze the US cities, their social demography, and business environment. We cannot guarantee the accuracy,
                        correctness and/or timeliness
                        of the data. Therefore, ClustrMaps.com cannot be used for any purpose covered by the <a
                                href="https://www.ftc.gov/legal-library/browse/statutes/fair-credit-reporting-act"><abbr
                                    title="Fair Credit Reporting Act">FCRA</abbr></a></div>
                </div>
                <div class="footer_about col-sm-3">
                    <div class="footer_header">About</div>
                    <a class="footer_link" href="/bl/about">About</a><br/>
                    <a class="footer_link" href="/bl/contacts">Contacts</a><br/>
                    <a class="footer_link" href="/bl/careers">Careers</a><br/>

                    <a class="footer_link" href="/d/">USA</a><br/>
                    <a class="footer_link" href="/zip/">ZIP Codes</a>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="footer_header">Legal</div>
                    <a class="footer_link" href="/bl/policy">Privacy Policy</a><br/>
                    <a class="footer_link" href="/bl/tos">Terms of Service</a><br/>
                    <a class="footer_link" href="/bl/opt-out">Opt Out</a><br/><br/>

                    <a href="https://www.facebook.com/clustrmaps">Facebook</a> <span class="fb-like" data-href="https://www.facebook.com/clustrmaps" data-layout="button_count" data-action="like"
                                                                                     data-show-faces="false" data-share="false" style="vertical-align: text-bottom"></span><br/><br/>
                    <span style="vertical-align: text-top;"><a class="twitter-follow-button" href="https://twitter.com/ClustrMaps">Follow @ClustrMaps</a></span>


				</div>
                <div class="col-sm-5 col-md-3">
                    <div class="footer_header">Widget</div>
                    <a class="footer_link" href="/add">Create Widget</a><br/>
                    <a class="footer_link" href="/legal">TOS</a><br/>
                    <a class="footer_link" href="/policy">Policy</a><br/>
                    <a class="footer_link" href="/how-to/">How To</a><br/>
                </div>
                <div class="col-md-8 col-md-offset-4"></div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col">
                    <img src="/assets/gl.svg" width="50" height="50" style="margin-right: 16px;"/> <span style="color: #767676; margin-right: 30px;">&copy; ClustrMaps.com</span>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

            $('body').ihavecookies({
                message: 'ClustrMaps uses cookies to provide its services. By continuing to browse the site you are agreeing to our use of cookies.',
                delay: 600,
                expires: 30,
                cookieTypes: [],
                acceptBtnLabel: 'Accept Cookies',
                link: "/cookies/"

            });


            $("body").css("margin-bottom", $(".footer").height() + "px");

        });


    </script>

    <script type='text/javascript'>
        var ajax = function () {
            ajax.init();
        }

        ajax.handlers = {};

        ajax.init = function () {

            ajax.body = $('body');

            ajax.body.delegate("[data-ajax_form]", 'submit', function (event) {
                var submit_el = $(this).find("[type=submit]");
                if (!submit_el.attr('disabled')) {
                    ajax.ajaxForm($(this), '&' + submit_el.attr('name') + '=' + submit_el.val());
                }
                return false;
            });
        }

        ajax.addHandler = function (name, handler) {
            ajax.handlers[name] = handler;
            return ajax;
        }

        ajax.ajaxForm = function (form_element, submit_value) {

            var handler = form_element.attr('data-ajax_form');
            var url = form_element.attr('action');

            var type = form_element.data('type');
            if (!type) {
                type = 'json'
            }

            if (typeof submit_value == 'undefined') {
                submit_value = '';
            }

            $.ajax({
                type: "POST",
                url: url,
                timeout: 15000,
                dataType: type,
                data: form_element.serialize() + submit_value,
                complete: function () {
                    //hide loader overlay if open
                },
                success: function (data, textStatus, jqXHR) {

                    if (type == 'json') {
                        if (jqXHR.getResponseHeader('x-ajax-redirect') !== null) {
                            window.location = jqXHR.getResponseHeader('x-ajax-redirect');
                            return false;
                        }


                        if ('url' in data) {
                            window.location = data.url;
                            return false;
                        }

                        if (handler in ajax.handlers) {
                            return ajax.handlers[handler](data);
                        }
                    } else {
                        console.log(handler);
                        console.log(data);

                        $(handler).html(data);
                    }
                    //console.log("Unknown handler: ", handler);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("there was an error!", textStatus, errorThrown);
                }
            });
        }

        //delay firing function until [ms] since last event, calling only the last queued event.
        var waitForFinalEvent = (function () {
            var timers = {};
            return function (callback, ms, uniqueId) {
                if (!uniqueId) {
                    uniqueId = "Don't call this twice without a uniqueId";
                }
                if (timers[uniqueId]) {
                    clearTimeout(timers[uniqueId]);
                }
                timers[uniqueId] = setTimeout(callback, ms);
            };
        })();

        //fire function once instantly and queue consecutive calls, firing only the last
        //queued call after [ms] since last call
        var throttleEvent = (function () {
            var timers = {};
            var finalTimers = {};
            return function (callback, ms, uniqueId) {

                //if function already queued, save this one as last one to fire.
                if (timers[uniqueId]) {
                    //clearTimeout (timers[uniqueId]);
                    finalTimers[uniqueId] = callback;
                    return false;
                } else {//fire this event and tell next one to wait
                    //fire event
                    callback();

                    //set final event to fire after delay
                    timers[uniqueId] = setTimeout(function () {

                        if (finalTimers[uniqueId]) {
                            finalTimers[uniqueId]();
                            finalTimers[uniqueId] = null;
                        }
                        timers[uniqueId] = null;
                    }, ms);


                }
            };
        })();
    </script>

    <script type='text/javascript'>
        $(function () {

            var Ajax = new ajax();

            $('body').delegate('[modal-ajax_url]', 'click', function (event) {
                var el = $(this);
                var url = el.attr('modal-ajax_url');
                $.ajax({
                    type: "GET",
                    url: url,
                    timeout: 15000,
                    dataType: 'html',
                    data: {},
                    complete: function () {
                        //hide loader overlay if open
                    },
                    success: function (data, textStatus, jqXHR) {
                        $("#modal_form div.modal-body").html(data);
                        prepareClipboard();
                        $("#modal_form").modal();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("there was an error!");
                    }
                });
            });

            ajax.addHandler('login', function (response) {
                console.log("Login: ", response);
                $(".login_form").find("div.alert").html(response.message).removeClass("hidden");
            }).addHandler('signup', function (response) {

                console.log("Signup:", response);
                $(".signup_form").find("div.alert").html(response.message).removeClass("hidden");

                if (response.field) {
                    if (response.field == "email") {
                        $("#inputEmail3").parent().parent().removeClass("has-success");
                        $("#inputEmail3").parent().parent().addClass("has-error");
                        $("#inputEmail3").parent().next("small.help-block").html("This email already in use. If you forget your password <a href='#'  data-dismiss='modal' data-toggle='modal' data-target='#forgot_password'>click here</a>").show();
                    }
                }
            }).addHandler('recovery', function (response) {
                if (response.ok) {
                    $("#forgot_all").hide();
                    $("#forgot_password").find("div.alert").html(response.message).removeClass("alert-danger").addClass("alert-success").removeClass("hidden");
                } else {
                    $("#forgot_password").find("div.alert").html(response.message).addClass("alert-danger").removeClass("hidden");
                }
            });
                    });
    </script>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-80980731-1', 'auto');
        ga('send', 'pageview');
    </script>
    <script>window.twttr = (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0],
                t = window.twttr || {};
            if (d.getElementById(id))
                return t;
            js = d.createElement(s);
            js.id = id;
            js.src = "https://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);

            t._e = [];
            t.ready = function (f) {
                t._e.push(f);
            };

            return t;
        }(document, "script", "twitter-wjs"));</script>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>




    <img width="1" height="1" src="//clustrmaps.com/map_v2.png?d=eA5xcTFMwdBZ7-AsdnfGEKEHVU1pLQFIPvzHIKAl1rA&cl=ffffff"/>
    <script>
    jQuery(document).ready(function () {
        jQuery("time.timeago").timeago();
    });
</script>
</body>
</html>
