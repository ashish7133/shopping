package net.ashish.shoppingbackend;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages={"net.ashish.shoppingbackend.dto"})
@EnableTransactionManagement
public class HibernateConfig {

	// Change the below based on the DBMS you choose
	private final static String DATABASE_URL = "jdbc:postgresql://ec2-54-235-253-198.compute-1.amazonaws.com:5432/d65h6mriooaj3o?user=dshrnmblssmhpd&password=94cc87dff1eb56da367fe188892eb3fb162847a8633fe4f19fcc6616b53d7f6c&sslmode=require";
	private final static String DATABASE_DRIVER = "org.postgresql.Driver";
	private final static String DATABASE_DIALECT = "org.hibernate.dialect.PostgreSQLDialect";
	private final static String DATABASE_USERNAME = "dshrnmblssmhpd";
	private final static String DATABASE_PASSWORD = "94cc87dff1eb56da367fe188892eb3fb162847a8633fe4f19fcc6616b53d7f6c";
	
	// dataSource bean will be available
	@Bean("dataSource")
	public DataSource getDataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		
		// Providing the database connection information
		dataSource.setDriverClassName(DATABASE_DRIVER);
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);
				
		
		return dataSource;
		
	}
	
	// sessionFactory bean will be available
	
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource) {
		
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("net.ashish.shoppingbackend.dto");
		
		return builder.buildSessionFactory();
		
	}

	
	
	// All the hibernate properties will be returned in this method	
	private Properties getHibernateProperties() {
		
		Properties properties = new Properties();
		
		
		properties.put("hibernate.dialect", DATABASE_DIALECT);		
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
//		properties.put("hibernate.ejb.naming_strategy", "org.hibernate.cfg.ImprovedNamingStrategy");		//hibernate.ejb.naming_strategy
		properties.put("hibernate.hbm2ddl.auto", "create");
		
		
		return properties;
	}
	
	// transactionManager bean
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
}
