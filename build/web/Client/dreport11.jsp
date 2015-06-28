<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="Connection.ConnectionManager"%>
<%@page import="java.net.URL"%>
<%@page import="Client.ClientBean"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsAbstractExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
    <head>
        <script type="text/javascript">
function backtopage() {

    window.history.back();
}
</script>
    </head>
    <body onload="backtopage();">
        <%
            ClientBean client = (ClientBean) session.getAttribute("Client");
    
            if (client == null) {
        %>
        Your session is Expired..Please <a href="../pages/index.jsp">Login</a>
        <%                } else {
              String cuid = client.getUid();
              System.out.print("Dreport cuid:"+cuid);
             JFileChooser fc = new JFileChooser();
        File file = null;
        String downloadloaction=null;
        fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        int i = fc.showOpenDialog(null);
        if (i == JFileChooser.APPROVE_OPTION) {
            file = fc.getSelectedFile();
            System.out.println(file.getAbsolutePath());
        } else {
            System.out.println("Failed to open directory");

        }
        try{
     //   ServletContext context = getServletContext();  

       // URL is = context.getResource("Client/TestReport.jrxml");
        
            String path="/Major_Project/Client/TestReport.jrxml";
         //   System.out.print("Filejrxml:"+is.getFile());
            JasperReport jasperReport = JasperCompileManager.compileReport("C:\\Users\\NaKs\\Documents\\Major_Project\\web\\Client\\TestReport.jrxml");
            

             Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "");
            Statement stmt = null;
            ResultSet rset = null;

        //    stmt = conn.createStatement();
        //    rset = stmt.executeQuery("SELECT uid from registration where uid='"+cuid+"'");
            
           Map parametersMap = new HashMap();  
            parametersMap.put("cuid",cuid);
           // JRResultSetDataSource jasperReports = new JRResultSetDataSource(rset);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parametersMap , conn);
           
//Report saved in specified path
            downloadloaction = file.getAbsolutePath() + "report.pdf";
            JasperExportManager.exportReportToPdfFile(jasperPrint, downloadloaction);
//Report open in Runtime
            Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + downloadloaction);
        /*    JRXlsExporter exporterXLS = new JRXlsExporter();
            OutputStream output = new FileOutputStream(new File(file.getAbsolutePath() + "report.xls"));
            exporterXLS.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporterXLS.setParameter(JRExporterParameter.OUTPUT_STREAM, output);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_COLLAPSE_ROW_SPAN, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_DETECT_CELL_TYPE, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsAbstractExporterParameter.IS_IGNORE_GRAPHICS, Boolean.TRUE);
            exporterXLS.exportReport();
            //JasperViewer.viewReport(jasperPrint);
*/
        } catch (JRException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
           
            }%>
            
            hiiii
    </body>
</html>