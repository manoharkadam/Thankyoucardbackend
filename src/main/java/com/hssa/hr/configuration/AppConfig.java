package com.hssa.hr.configuration;
/*package com.cdm.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.ws.config.annotation.EnableWs;
import org.springframework.ws.config.annotation.WsConfigurerAdapter;
import org.springframework.ws.wsdl.wsdl11.DefaultWsdl11Definition;
import org.springframework.xml.xsd.SimpleXsdSchema;
import org.springframework.xml.xsd.XsdSchema;

@Configuration
@EnableWs
@ComponentScan("com.cdm.configuration") 
public class AppConfig extends WsConfigurerAdapter {

	@Bean(name = "createCustomerMasterRequest")
	public DefaultWsdl11Definition defaultWsdl11Definition(XsdSchema customerSchema) {
		DefaultWsdl11Definition wsdl11Definition = new DefaultWsdl11Definition();
		wsdl11Definition.setPortTypeName("CustomerMasterPort");
		wsdl11Definition.setLocationUri("/soapws/createCustomer");
		wsdl11Definition.setTargetNamespace("http://customermaster.priceglider.com/soap");
		wsdl11Definition.setSchema(customerSchema);
		return wsdl11Definition;
	}
	
	@Bean
	public XsdSchema customerSchema() {
		return new SimpleXsdSchema(new ClassPathResource("xsd/customerMaster.xsd"));
	} 
	
	@Bean(name = "createMaterialsMasterRequest")
	public DefaultWsdl11Definition defaultWsdl11Definition1(XsdSchema materialsSchema) {
		DefaultWsdl11Definition wsdl11Definition = new DefaultWsdl11Definition();
		wsdl11Definition.setPortTypeName("MaterialsMasterPort");
		wsdl11Definition.setLocationUri("/soapws/createMaterials");
		wsdl11Definition.setTargetNamespace("http://materialsmaster.priceglider.com/soap");
		wsdl11Definition.setSchema(materialsSchema);
		return wsdl11Definition;
	}
	
	@Bean
	public XsdSchema materialsSchema() {
		return new SimpleXsdSchema(new ClassPathResource("xsd/materialsMaster.xsd"));
	}
	
	@Bean(name = "createSoSgCustomerMasterRequest")
	public DefaultWsdl11Definition defaultWsdl11Definition2(XsdSchema sosgcustomerSchema) {
		DefaultWsdl11Definition wsdl11Definition = new DefaultWsdl11Definition();
		wsdl11Definition.setPortTypeName("SoSgCustomerMasterPort");
		wsdl11Definition.setLocationUri("/soapws/createSoSgCustomer");
		wsdl11Definition.setTargetNamespace("http://sosgcustomermaster.priceglider.com/soap");
		wsdl11Definition.setSchema(sosgcustomerSchema);
		return wsdl11Definition;
	}
	
	@Bean
	public XsdSchema sosgcustomerSchema() {
		return new SimpleXsdSchema(new ClassPathResource("xsd/sosgCustomerMaster.xsd"));
	}
	
	@Bean(name = "createSoSgPlantMasterRequest")
	public DefaultWsdl11Definition defaultWsdl11Definition3(XsdSchema sosgplantSchema) {
		DefaultWsdl11Definition wsdl11Definition = new DefaultWsdl11Definition();
		wsdl11Definition.setPortTypeName("SoSgPlantMasterPort");
		wsdl11Definition.setLocationUri("/soapws/createSoSgPlant");
		wsdl11Definition.setTargetNamespace("http://sosgplantmaster.priceglider.com/soap");
		wsdl11Definition.setSchema(sosgplantSchema);
		return wsdl11Definition;
	}
	
	@Bean
	public XsdSchema sosgplantSchema() {
		return new SimpleXsdSchema(new ClassPathResource("xsd/sosgPlantMaster.xsd"));
	}
}
*/