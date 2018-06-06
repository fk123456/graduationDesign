<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
    <script language="javascript">
        $(function () {
            $('#owl-demo').owlCarousel({
                items: 1,
                navigation: true,
                navigationText: ["上一个", "下一个"],
                autoPlay: true,
                stopOnHover: true
            }).hover(function () {
                $('.owl-buttons').show();
            }, function () {
                $('.owl-buttons').hide();
            });
        });
    </script>
</head>

<body>
<!--头部-->
<%@include file="parent.jsp" %>
<!--头部-->
<!--幻灯片-->
<%--<div id="banner" class="banner">
    <div id="owl-demo" class="owl-carousel"> 
        <a class="item" target="_blank" href="" style="background-image:url(upload/banner.jpg)">
            <img src="upload/banner.jpg" alt="">
        </a>
        <a class="item" target="_blank" href="" style="background-image:url(upload/banner.jpg)">
            <img src="upload/banner.jpg" alt="">
        </a>
        <a class="item" target="_blank" href="" style="background-image:url(upload/banner.jpg)">
            <img src="upload/banner.jpg" alt="">
        </a>
    </div>
</div>--%>
<!--幻灯片-->
<div class="space_hx">&nbsp;</div>
<div class="i_ma">
    <div class="line">&nbsp;</div>
    <ul class="clearfix">
        <li>
            <span class="date">1953</span>
            <div class="a_m">
                <span>1953</span>
                <p>浙江省中医进修学校</p>
            </div>
        </li>
        <li>
            <span class="date">1959</span>
            <div class="a_m">
                <span>1959</span>
                <p>浙江中医学院</p>
            </div>
        </li>
        <li>
            <span class="date">2006</span>
            <div class="a_m">
                <span>2006</span>
                <p>浙江中医药大学</p>
            </div>
        </li>
        <li>
            <span class="date">2015</span>
            <div class="a_m">
                <span>2015</span>
                <p>中医药大学滨江学院竣工</p>
            </div>
        </li>
        <li>
            <span class="date">2015</span>
            <div class="a_m">
                <span>2015</span>
                <p>滨江学院迁建工程</p>
            </div>
        </li>
        <li>
            <span class="date">2017</span>
            <div class="a_m">
                <span>2017</span>
                <p>浙江省重点建设高校</p>
            </div>
        </li>
        <li>
            <span class="date">2017</span>
            <div class="a_m">
                <span>2017</span>
                <p>浙江省重点建设高校</p>
            </div>
        </li>
    </ul>
</div>
<div class="space_hx">&nbsp;</div>
<div class="i_mb clearfix">
    <div class="i_mbl">
        <div class="i_name"><span>学校简介</span></div>
        <div class="i_about">
            <a href=""><img src="images/zcmu.jpg" alt=""/></a>
            <div class="des">
                浙江中医药大学是一所以中医中药为主，医理工管文多学科协调发展的省属高校.....
            </div>
            <div class="i_more"><a href="about?num=1">了解详情</a></div>
        </div>
    </div>
    <div class="i_mbm">
        <div class="i_name"><span>新品介绍</span></div>
        <div class="i_pro">
            <dl class="clearfix">
                <dt><a href=""><img src="upload/pic1.jpg" alt=""/></a></dt>
                <dd>
                    <div class="des">北京于银杏叶分散片产品检片产品检片产品检片片产品检片产品检片产品检片产品检片产品检片品检片产品检片产品检...</div>
                    <div class="i_more"><a href="">了解详情</a></div>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt><a href=""><img src="upload/pic1.jpg" alt=""/></a></dt>
                <dd>
                    <div class="des">北京于银杏叶分散片产品检片产品检片产品检片片产品检片产品检片产品检片产品检片产品检片品检片产品检片产品检...</div>
                    <div class="i_more"><a href="">了解详情</a></div>
                </dd>
            </dl>
        </div>
    </div>
    <div class="i_mbr">
        <div class="i_name"><span>新闻资讯</span></div>
        <ul class="i_news">
            <li><a href="">北京于银杏叶分散片产品</a></li>
            <li><a href="">北京于银杏叶分散片产品</a></li>
            <li><a href="">北京于银杏叶分散片产品</a></li>
            <li><a href="">北京于银杏叶分散片产品</a></li>
            <li><a href="">北京于银杏叶分散片产品</a></li>
            <li><a href="">北京于银杏叶分散片产品</a></li>
            <li><a href="">北京于银杏叶分散片产品</a></li>
        </ul>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<div class="i_mb clearfix">
    <div class="i_mb1">
        <div class="i_name"><span>产品体系</span><a href="">了解详情</a></div>
        <div class="tx clearfix">
            <div class="tx_l">
                <input name="" type="text" placeholder="请输入关键字">
                <select name="">
                    <option>请选择产品类别</option>
                    <option>类别1</option>
                    <option>类别2</option>
                </select>
                <input name="" type="submit" value="搜索">
                <a href=""><img src="upload/pic2.jpg" alt=""/></a>
            </div>
            <ul class="tx_r">
                <li>
                    <a href="" class="on">血氧饱和度探头</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                </li>
                <li>
                    <a href="" class="on">血氧饱和度探头</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                </li>
                <li>
                    <a href="" class="on">血氧饱和度探头</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                </li>
                <li>
                    <a href="" class="on">血氧饱和度探头</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                    <a href="">提前网上</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="i_mb2">
        <div class="i_name"><span>展会信息</span></div>
        <dl class="clearfix">
            <dt><a href=""><img src="upload/pic3.jpg" alt=""/></a></dt>
            <dd>
                <div class="des">
                    北京于银杏叶分散片产散片散北京于北京于银杏叶分散片产散片散银杏叶分散片产散片散分散片产散片散分散片分散片产散片散分散片产散片散分散片分散片产散片散分散片产散片散分散片分散片产散片散分散片产散片散分散片分散片产散片散...
                </div>
                <div class="i_more"><a href="">了解详情</a></div>
            </dd>
        </dl>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<%@include file="foot.jsp" %>
</body>
</html>
