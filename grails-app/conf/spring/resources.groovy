import org.springframework.web.servlet.i18n.SessionLocaleResolver;

// Place your Spring DSL code here
beans = {
    System.setProperty('org.hibernate.envers.audit_table_prefix', 'AUDITED_')
    System.setProperty('org.hibernate.envers.audit_table_suffix', '')
    localeResolver(SessionLocaleResolver) {
        defaultLocale= new java.util.Locale('en');
    }
}