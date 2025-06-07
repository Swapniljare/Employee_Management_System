package controller;


import javax.servlet.*;

public class SessionCleanupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // This only happens on server startup / app deployment
        ServletContext context = sce.getServletContext();
        // Can't invalidate sessions here easily without tracking sessions,
        // so better to rely on server behavior or handle logout explicitly
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // No action needed here
    }
}