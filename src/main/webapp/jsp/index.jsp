<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.example.demo.dto.UserDTO" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
  Object principal = auth.getPrincipal();
  String username = "";
  if(principal instanceof UserDTO){
    username = ((UserDTO) principal).getUsername();
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>WEB MONITORING</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' href='../css/index.css' />
    <link rel='stylesheet' href='../css/reset.css' />
    <link rel='stylesheet' href='../css/common.css' />

    <!-- including ECharts file -->
    <script src="../js/echarts.min.js"></script>
    <!-- including Vanilla-DataTables file -->
    <link href="https://cdn.jsdelivr.net/npm/vanilla-datatables@latest/dist/vanilla-dataTables.min.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/vanilla-datatables@latest/dist/vanilla-dataTables.min.js" type="text/javascript"></script>

  </head>
  <body>
  <span>${pageContext.request.contextPath}</span>
    <!-- 헤더 시작-->
    <%@ include file="header.jsp" %>
    <!-- 헤더 끝-->

    <!-- 메인 영역 시작-->
    <section class="container">

      <!-- 조회 조건 시작 -->
      <div class="condition">
        <input class="SCD3 fs15 ml20 mr20" type="date" value="xxx" min="yyy" max="zzz">
        <input class="SCD3 fs15 ml20 mr20" type="date" value="xxx" min="yyy" max="zzz">
      </div>
      <!-- 조회 조건 끝 -->

      <!-- 그래프 시작 -->
      <div class="graph">
        <div id="graph_test" style="width: 90%; height: 80%;"></div>
      </div>
      <!-- 그래프 끝 -->

      <!-- 표 시작 -->
      <div class="table">
        <table id="table_test">
          <thead>
          <tr>
            <th>Name</th>
            <th>Ext.</th>
            <th>City</th>
            <th data-type="date" data-format="YYYY/MM/DD">Start Date</th>
            <th>Completion</th>
          </tr>
          </thead>
          <tbody>
          <tr><td>Unity Pugh</td><td>9958</td><td>Curicó</td><td>2005/02/11</td><td>37%</td></tr>
          <tr><td>Theodore Duran</td><td>8971</td><td>Dhanbad</td><td>1999/04/07</td><td>97%</td></tr>
          <tr><td>Kylie Bishop</td><td>3147</td><td>Norman</td><td>2005/09/08</td><td>63%</td></tr>
          <tr><td>Willow Gilliam</td><td>3497</td><td>Amqui</td><td>2009/29/11</td><td>30%</td></tr>
          <tr><td>Blossom Dickerson</td><td>5018</td><td>Kempten</td><td>2006/11/09</td><td>17%</td></tr>
          <tr><td>Elliott Snyder</td><td>3925</td><td>Enines</td><td>2006/03/08</td><td>57%</td></tr>
          <tr><td>Castor Pugh</td><td>9488</td><td>Neath</td><td>2014/23/12</td><td>93%</td></tr>
          <tr><td>Pearl Carlson</td><td>6231</td><td>Cobourg</td><td>2014/31/08</td><td>100%</td></tr>
          <tr><td>Deirdre Bridges</td><td>1579</td><td>Eberswalde-Finow</td><td>2014/26/08</td><td>44%</td></tr>
          <tr><td>Daniel Baldwin</td><td>6095</td><td>Moircy</td><td>2000/11/01</td><td>33%</td></tr>
          <tr><td>Phelan Kane</td><td>9519</td><td>Germersheim</td><td>1999/16/04</td><td>77%</td></tr>
          <tr><td>Quentin Salas</td><td>1339</td><td>Los Andes</td><td>2011/26/01</td><td>49%</td></tr>
          <tr><td>Armand Suarez</td><td>6583</td><td>Funtua</td><td>1999/06/11</td><td>9%</td></tr>
          <tr><td>Gretchen Rogers</td><td>5393</td><td>Moxhe</td><td>1998/26/10</td><td>24%</td></tr>
          <tr><td>Harding Thompson</td><td>2824</td><td>Abeokuta</td><td>2008/06/08</td><td>10%</td></tr>
          <tr><td>Mira Rocha</td><td>4393</td><td>Port Harcourt</td><td>2002/04/10</td><td>14%</td></tr>
          <tr><td>Wyatt Mccarthy</td><td>3547</td><td>Patan</td><td>2014/23/06</td><td>9%</td></tr>
          <tr><td>Cairo Rice</td><td>6273</td><td>Ostra Vetere</td><td>2016/27/02</td><td>13%</td></tr>
          <tr><td>Paki Santos</td><td>4424</td><td>Cache Creek</td><td>2001/18/11</td><td>82%</td></tr>
          <tr><td>Ross Hodges</td><td>1862</td><td>Trazegnies</td><td>2010/19/09</td><td>87%</td></tr>
          <tr><td>Hilda Whitley</td><td>3514</td><td>New Sarepta</td><td>2011/05/07</td><td>94%</td></tr>
          <tr><td>Roth Cherry</td><td>4006</td><td>Flin Flon</td><td>2008/02/09</td><td>8%</td></tr>
          <tr><td>Lareina Jones</td><td>8642</td><td>East Linton</td><td>2009/07/08</td><td>21%</td></tr>
          <tr><td>Joshua Weiss</td><td>2289</td><td>Saint-L�onard</td><td>2010/15/01</td><td>52%</td></tr>
          <tr><td>Kiona Lowery</td><td>5952</td><td>Inuvik</td><td>2002/17/12</td><td>72%</td></tr>
          <tr><td>Nina Rush</td><td>7567</td><td>Bo‘lhe</td><td>2008/27/01</td><td>6%</td></tr>
          <tr><td>Palmer Parker</td><td>2000</td><td>Stade</td><td>2012/24/07</td><td>58%</td></tr>
          <tr><td>Vielka Olsen</td><td>3745</td><td>Vrasene</td><td>2016/08/01</td><td>70%</td></tr>
          <tr><td>Meghan Cunningham</td><td>8604</td><td>Söke</td><td>2007/16/02</td><td>59%</td></tr>
          <tr><td>Iola Shaw</td><td>6447</td><td>Albany</td><td>2014/05/03</td><td>88%</td></tr>
          <tr><td>Imelda Cole</td><td>4564</td><td>Haasdonk</td><td>2007/16/11</td><td>79%</td></tr>
          <tr><td>Jerry Beach</td><td>6801</td><td>Gattatico</td><td>1999/07/07</td><td>36%</td></tr>
          <tr><td>Garrett Rocha</td><td>3938</td><td>Gavorrano</td><td>2000/06/08</td><td>71%</td></tr>
          <tr><td>Derek Kerr</td><td>1724</td><td>Gualdo Cattaneo</td><td>2014/21/01</td><td>89%</td></tr>
          <tr><td>Shad Hudson</td><td>5944</td><td>Salamanca</td><td>2014/10/12</td><td>98%</td></tr>
          <tr><td>Daryl Ayers</td><td>8276</td><td>Barchi</td><td>2012/12/11</td><td>88%</td></tr>
          <tr><td>Caleb Livingston</td><td>3094</td><td>Fatehpur</td><td>2014/13/02</td><td>8%</td></tr>
          <tr><td>Sydney Meyer</td><td>4576</td><td>Neubrandenburg</td><td>2015/06/02</td><td>22%</td></tr>
          <tr><td>Lani Lawrence</td><td>8501</td><td>Turnhout</td><td>2008/07/05</td><td>16%</td></tr>
          <tr><td>Allegra Shepherd</td><td>2576</td><td>Meeuwen-Gruitrode</td><td>2004/19/04</td><td>41%</td></tr>
          <tr><td>Fallon Reyes</td><td>3178</td><td>Monceau-sur-Sambre</td><td>2005/15/02</td><td>16%</td></tr>
          <tr><td>Karen Whitley</td><td>4357</td><td>Sluis</td><td>2003/02/05</td><td>23%</td></tr>
          <tr><td>Stewart Stephenson</td><td>5350</td><td>Villa Faraldi</td><td>2003/05/07</td><td>65%</td></tr>
          <tr><td>Ursula Reynolds</td><td>7544</td><td>Southampton</td><td>1999/16/12</td><td>61%</td></tr>
          <tr><td>Adrienne Winters</td><td>4425</td><td>Laguna Blanca</td><td>2014/15/09</td><td>24%</td></tr>
          <tr><td>Francesca Brock</td><td>1337</td><td>Oban</td><td>2000/12/06</td><td>90%</td></tr>
          <tr><td>Ursa Davenport</td><td>7629</td><td>New Plymouth</td><td>2013/27/06</td><td>37%</td></tr>
          <tr><td>Mark Brock</td><td>3310</td><td>Veenendaal</td><td>2006/08/09</td><td>41%</td></tr>
          <tr><td>Dale Rush</td><td>5050</td><td>Chicoutimi</td><td>2000/27/03</td><td>2%</td></tr>
          <tr><td>Shellie Murphy</td><td>3845</td><td>Marlborough</td><td>2013/13/11</td><td>72%</td></tr>
          <tr><td>Porter Nicholson</td><td>4539</td><td>Bismil</td><td>2012/22/10</td><td>23%</td></tr>
          <tr><td>Oliver Huber</td><td>1265</td><td>Hannche</td><td>2002/11/01</td><td>94%</td></tr>
          <tr><td>Calista Maynard</td><td>3315</td><td>Pozzuolo del Friuli</td><td>2006/23/03</td><td>5%</td></tr>
          <tr><td>Lois Vargas</td><td>6825</td><td>Cumberland</td><td>1999/25/04</td><td>50%</td></tr>
          <tr><td>Hermione Dickson</td><td>2785</td><td>Woodstock</td><td>2001/22/03</td><td>2%</td></tr>
          <tr><td>Dalton Jennings</td><td>5416</td><td>Dudzele</td><td>2015/09/02</td><td>74%</td></tr>
          <tr><td>Cathleen Kramer</td><td>3380</td><td>Crowsnest Pass</td><td>2012/27/07</td><td>53%</td></tr>
          <tr><td>Zachery Morgan</td><td>6730</td><td>Collines-de-l'Outaouais</td><td>2006/04/09</td><td>51%</td></tr>
          <tr><td>Yoko Freeman</td><td>4077</td><td>Lidköping</td><td>2002/27/12</td><td>48%</td></tr>
          <tr><td>Chaim Waller</td><td>4240</td><td>North Shore</td><td>2010/25/07</td><td>25%</td></tr>
          <tr><td>Berk Johnston</td><td>4532</td><td>Vergnies</td><td>2016/23/02</td><td>93%</td></tr>
          <tr><td>Tad Munoz</td><td>2902</td><td>Saint-Nazaire</td><td>2010/09/05</td><td>65%</td></tr>
          <tr><td>Vivien Dominguez</td><td>5653</td><td>Bargagli</td><td>2001/09/01</td><td>86%</td></tr>
          <tr><td>Carissa Lara</td><td>3241</td><td>Sherborne</td><td>2015/07/12</td><td>72%</td></tr>
          <tr><td>Hammett Gordon</td><td>8101</td><td>Wah</td><td>1998/06/09</td><td>20%</td></tr>
          <tr><td>Walker Nixon</td><td>6901</td><td>Metz</td><td>2011/12/11</td><td>41%</td></tr>
          <tr><td>Nathan Espinoza</td><td>5956</td><td>Strathcona County</td><td>2002/25/01</td><td>47%</td></tr>
          <tr><td>Kelly Cameron</td><td>4836</td><td>Fontaine-Valmont</td><td>1999/02/07</td><td>24%</td></tr>
          <tr><td>Kyra Moses</td><td>3796</td><td>Quenast</td><td>1998/07/07</td><td>68%</td></tr>
          <tr><td>Grace Bishop</td><td>8340</td><td>Rodez</td><td>2012/02/10</td><td>4%</td></tr>
          <tr><td>Haviva Hernandez</td><td>8136</td><td>Suwałki</td><td>2000/30/01</td><td>16%</td></tr>
          <tr><td>Alisa Horn</td><td>9853</td><td>Ucluelet</td><td>2007/01/11</td><td>39%</td></tr>
          <tr><td>Zelenia Roman</td><td>7516</td><td>Redwater</td><td>2012/03/03</td><td>31%</td></tr>
          </tbody>
        </table>
      </div>
      <!-- 표 끝 -->

    </section>
    <!-- 메인 영역 끝-->


    <!-- 푸터 시작 -->
    <%@ include file="footer.jsp" %>
    <!-- 푸터 끝 -->
  </body>
  <script type="text/javascript">
    // DOM을 준비하고 echart 객체를 만듭니다.
    var myChart = echarts.init(document.getElementById('graph_test'));

    // 차트 속성과 데이터를 지정합니다.
    option = {
      title: {
        text: 'Customized Pie',
        left: 'center',
        top: 20,
      },

      tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
      },

      visualMap: {
        show: false,
        min: 80,
        max: 600,
        inRange: {
          colorLightness: [0, 1]
        }
      },
      series: [
        {
          name: '제목이뭘까',
          type: 'pie',
          radius: '55%',
          center: ['50%', '50%'],
          data: [
            {value: 335, name: 'BOTTLE'},
            {value: 310, name: 'SHOES'},
            {value: 274, name: 'BATTERY'},
            {value: 235, name: 'BAG'},
            {value: 400, name: 'DRUG'}
          ].sort(function (a, b) { return a.value - b.value; }),
          roseType: 'radius',

          labelLine: {
            smooth: 0.2,
            length: 10,
            length2: 20
          },
          itemStyle: {
            color: '#c23531'
          },

          animationType: 'scale',
          animationEasing: 'elasticOut',
          animationDelay: function (idx) {
            return Math.random() * 200;
          }
        }
      ]
    };

    // 위에서 설정한 속성을 차트에 반영합니다.
    myChart.setOption(option);
  </script>

  <script>
    var dataTable = new DataTable("#table_test",{
      perPage: 7,
      perPageSelect: false,
    });
  </script>

</html>
