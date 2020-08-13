<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MemDollar</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://cdn.3up.dk/flexgrid.io@2.5.1/css/flexgrid.min.css'>
        <style>
            @import url("https://fonts.googleapis.com/css?family=Roboto+Mono:300,500");
            html, body {
                width: 100%;
                height: 100%;
            }

            body {
                background-image: url(../images/background.jpg);
                background-size: cover;
                background-repeat: no-repeat;
                min-height: 100vh;
                min-width: 100vw;
                font-family: "Roboto Mono", "Liberation Mono", Consolas, monospace;
                color: rgba(255, 255, 255, 0.87);
            }

            .mx-auto {
                margin-left: auto;
                margin-right: auto;
            }

            .container,
            .container > .row,
            .container > .row > div {
                height: 100%;
            }

            #countUp {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100%;
            }

            .blur {
                background: url(../images/background.jpg) no-repeat center center fixed;
                background-size: cover;
                overflow: hidden;
                filter: blur(13px);
                position: absolute;
                height: 360px;
                z-index: 99;
                margin: auto;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
            }

            .number-background{
                border: 5px solid rgba(255, 255, 255, .5);
                padding: 3em 2em;
                z-index: 999;
            }

            .number-background button{
                padding: 0.5em 1em;
                font-size: 15px;
                font-weight: bold;
                border-radius: 5px;
                border:1px solid transparent;
                margin:0.5em auto;
                display:block;
                cursor: pointer;
            }

            #countUp .number {
                font-size: 4rem;
                font-weight: 500;
                text-align: center;
            }
            #countUp .number + .text {
                margin: 0 0 1rem;

            }
            #countUp .text {
                font-weight: 300;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="xs-12 md-6 mx-auto">
                    <div id="countUp" >

                        <div class="blur"></div>
                        <div class="number-background">
                            <div class="number" data-count="500">0</div>
                            <div class="text">500 Internal Server Error</div>
                            <div class="text">This may not mean anything.</div>
                            <div class="text">MemDollar is probably working on something that has blown up.</div>
                            
                            <button onclick="window.history.go(-1); return false;">Go back to previous page</button>
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        <script src='https://cdn.3up.dk/in-view@0.6.1'></script>
        <script>
                                var formatThousandsNoRounding = function (n, dp) {
                                    var e = '', s = e + n, l = s.length, b = n < 0 ? 1 : 0,
                                            i = s.lastIndexOf(','), j = i == -1 ? l : i,
                                            r = e, d = s.substr(j + 1, dp);
                                    while ((j -= 3) > b) {
                                        r = '.' + s.substr(j, 3) + r;
                                    }
                                    return s.substr(0, j + 3) + r +
                                            (dp ? ',' + d + (d.length < dp ?
                                                    ('00000').substr(0, dp - d.length) : e) : e);
                                };

                                var hasRun = false;

                                inView('#countUp').on('enter', function () {
                                    if (hasRun == false) {
                                        $('.number').each(function () {
                                            var $this = $(this),
                                                    countTo = $this.attr('data-count');

                                            $({countNum: $this.text()}).animate({
                                                countNum: countTo
                                            },
                                                    {
                                                        duration: 2000,
                                                        easing: 'linear',
                                                        step: function () {
                                                            $this.text(formatThousandsNoRounding(Math.floor(this.countNum)));
                                                        },
                                                        complete: function () {
                                                            $this.text(formatThousandsNoRounding(this.countNum));
                                                        }
                                                    });
                                        });
                                        hasRun = true;
                                    }
                                });
        </script>
    </body>
</html>
