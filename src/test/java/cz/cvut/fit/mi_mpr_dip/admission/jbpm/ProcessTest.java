package cz.cvut.fit.mi_mpr_dip.admission.jbpm;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import junit.framework.TestCase;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Admission;
import cz.cvut.fit.mi_mpr_dip.admission.domain.AdmissionState;
import cz.cvut.fit.mi_mpr_dip.admission.domain.Evaluation;
import cz.cvut.fit.mi_mpr_dip.admission.domain.EvaluationType;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.Address;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.AddressType;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.City;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.Country;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.PrintLine;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Document;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.DocumentType;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Person;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Degree;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Language;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Programme;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.StudyMode;

/**
 * This is a sample file to launch a process.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/META-INF/spring/applicationContext.xml" })
public class ProcessTest extends TestCase { // extends JbpmJUnitTestCase {

	@Autowired
	ProcessService processService;

	private Admission admission;

	@Before
	public void setUp() {
		admission = setTestAdmission();
	}

	@Test
	public void testRunProcess() {
		processService.runProcess();
	}

	/*@Test
	public void testCondition() {
		boolean b = false;
		boolean b_1 = false;
		boolean b_2 = false;
		if (admission.getAccepted()) {
			b = true;
			//return true;
		}

		for (Evaluation evaluation : admission.getEvaluations()) {
			String value = evaluation.getValue();
			String type = evaluation.getEvaluationType().getName();
			String citizenship = admission.getPerson().getCitizenship().getName();
			
			if (!citizenship.isEmpty()) {
				if (type.equals("H3") && Double.valueOf(value) > 0) {
					System.out.println("1 dokumenty ok: [" + type + "] MV, DIPLOM, ... - " + value);
					b = true;
					//return true;
				}
			} else {
				if (type.equals("H3") && Double.valueOf(value) > 0) {
					System.out.println("2 dokumenty ok: [" + type + "] MV, DIPLOM, ... - " + value);
					b_1 = true;
				}
				if (type.equals("H4") && Double.valueOf(value) > 0) {
					System.out.println("3 dokumenty ok: [" + type + "] ZKOUSKA z CJ - " + value);
					b_2 = true;
				}
			}
		}
		if (b_1 && b_2) {
			b = true;// return true;
		}
		if (b) {
			System.out.println("DOKUMENTY V PORADKU");
		} else {
			System.out.println("DODAT DOKUMENTY");
		}

		// return b;
		assertTrue(b);
	}*/

	@Test
	public void testValidAdmissionData() {
		isAdmissionValid(admission);
	}

	@Test
	public void testProcess() {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("admission", admission);

		processService.runProcess(parameters);
	}
	
	@Test
	public void testEmailHandler() {
		// TODO
		processService.runEmailProcess();
	}

	@Test
	public void testProcessWithDataFromDB() {
		// TODO
		
	}

	private Admission setTestAdmission() {
		Admission a = new Admission();
		a.setCode("73935282");
		a.setType("P");
		a.setAccepted(false);
		a.setAppeal(false);

		AdmissionState state = new AdmissionState();
		state.setCode("S01");
		state.setName("NEW");

		a.setAdmissionState(state);

		Person p = new Person();
		p.setFirstname("Frantisek");
		p.setLastname("Vomáčka");
		p.setBirthIdentificationNumber("8203151111");
		p.setPhone("737999999");
		p.setEmail("f.vomacka@mail.cz");

		City c = new City();
		c.setName("Město v ČR");

		Country co = new Country();
		co.setName("Česká republika");

		AddressType adt1 = new AddressType();
		adt1.setName("main");

		AddressType adt2 = new AddressType();
		adt2.setName("contact");

		PrintLine pl1 = new PrintLine();
		pl1.setName("1. řádek");
		pl1.setValue("František Vomáčka");

		PrintLine pl2 = new PrintLine();
		pl2.setName("2. řádek");
		pl2.setValue("Ulice 37");

		PrintLine pl3 = new PrintLine();
		pl3.setName("3. řádek");
		pl3.setValue("99988 Město v ČR");

		PrintLine pl4 = new PrintLine();
		pl4.setName("4. řádek");
		pl4.setValue("");

		PrintLine pl5 = new PrintLine();
		pl5.setName("5. řádek");
		pl5.setValue("");

		Set<PrintLine> printLines = new HashSet<PrintLine>();
		printLines.add(pl1);
		printLines.add(pl2);
		printLines.add(pl3);
		printLines.add(pl4);
		printLines.add(pl5);

		Address ad = new Address();
		ad.setStreet("Ulice");
		ad.setHouseNumber("37");
		ad.setCity(c);
		ad.setPostalCode("99988");
		ad.setCountry(co);
		ad.setAddressType(adt1);
		ad.setPrintLines(printLines);

		Address adc = new Address();
		adc.setStreet("Ulice");
		adc.setHouseNumber("37");
		adc.setCity(c);
		adc.setPostalCode("99988");
		adc.setCountry(co);
		adc.setAddressType(adt2);
		adc.setPrintLines(printLines);

		Set<Address> addresses = new HashSet<Address>();
		addresses.add(ad);
		addresses.add(adc);

		p.setAddresses(addresses);
		p.setCitizenship(co);
		p.setCityOfBirth(c);
		p.setCountryOfBirth(co);

		Document d = new Document();
		DocumentType dt = new DocumentType();
		dt.setName("OP");
		d.setNumber("111222333");
		d.setDocumentType(dt);

		Set<Document> documents = new HashSet<Document>();
		documents.add(d);

		p.setDocuments(documents);

		a.setPerson(p);

		Degree degree = new Degree();
		degree.setName("B");

		StudyMode studyMode = new StudyMode();
		studyMode.setName("P");

		Language language = new Language();
		language.setName("cz");

		Programme programme = new Programme();
		programme.setDegree(degree);
		programme.setStudyMode(studyMode);
		programme.setLanguage(language);
		programme.setName("BI");

		a.setProgramme(programme);

		EvaluationType h1 = new EvaluationType();
		h1.setName("H1");
		EvaluationType h3 = new EvaluationType();
		h3.setName("H3");
		EvaluationType h5 = new EvaluationType();
		h5.setName("H5");
		EvaluationType h7 = new EvaluationType();
		h7.setName("H7");

		Evaluation e1 = new Evaluation();
		e1.setEvaluationType(h1);
		e1.setValue("Varianta A");

		Evaluation e3 = new Evaluation();
		e3.setEvaluationType(h3);
		e3.setValue("1");

		Evaluation e5 = new Evaluation();
		e5.setEvaluationType(h5);
		e5.setValue("Olympiáda z Matematiky 2011!");

		Evaluation e7 = new Evaluation();
		e7.setEvaluationType(h7);
		e7.setValue("90");

		Set<Evaluation> evaluations = new HashSet<Evaluation>();
		evaluations.add(e1);
		evaluations.add(e3);
//		evaluations.add(e5);
//		evaluations.add(e7);

		a.setEvaluations(evaluations);

		return a;
	}

	private void isAdmissionValid(Admission admission) {
		assertNotNull(admission);
		assertNotNull(admission.getCode());
		assertNotNull(admission.getAccepted());
		isAdmissionStateValid(admission.getAdmissionState());

		if (!admission.getEvaluations().isEmpty()) {
			for (Evaluation evaluation : admission.getEvaluations()) {
				isEvaluationValid(evaluation);
			}
		}
		isPersonValid(admission.getPerson());
		isProgrammeValid(admission.getProgramme());
	}

	private void isAdmissionStateValid(AdmissionState admissionState) {
		assertNotNull(admissionState);
		assertNotNull(admissionState.getCode());
		assertNotNull(admissionState.getName());
		// assertNotNull(admissionState.getDesciption());
	}

	private void isProgrammeValid(Programme programme) {
		assertNotNull(programme);
		assertNotNull(programme.getDegree());
		assertNotNull(programme.getStudyMode());
		assertNotNull(programme.getLanguage());
	}

	private void isPersonValid(Person person) {
		assertNotNull(person);
		assertNotNull(person.getFirstname());
		assertNotNull(person.getLastname());
		assertNotNull(person.getBirthIdentificationNumber());
		assertNotNull(person.getEmail());
		assertNotNull(person.getPhone());
		assertNotNull(person.getCitizenship());
		assertNotNull(person.getCountryOfBirth());
		assertNotNull(person.getCityOfBirth());
		assertNotNull(person.getAddresses());
		assertTrue(!person.getAddresses().isEmpty());
		if (!person.getAddresses().isEmpty()) {
			for (Address address : person.getAddresses()) {
				isAddressValid(address);
			}
		}
		assertNotNull(person.getDocuments());
		assertTrue(!person.getDocuments().isEmpty());
		if (!person.getDocuments().isEmpty()) {
			for (Document document : person.getDocuments()) {
				isDocumentValid(document);
			}
		}
	}

	private void isDocumentValid(Document document) {
		assertNotNull(document);
		assertNotNull(document.getDocumentType());
	}

	private void isAddressValid(Address address) {
		assertNotNull(address);
		assertNotNull(address.getCity());
		assertNotNull(address.getPostalCode());
		assertNotNull(address.getCountry());
		assertNotNull(address.getAddressType());
		assertNotNull(address.getPrintLines());
	}

	private void isEvaluationValid(Evaluation evaluation) {
		assertNotNull(evaluation.getValue());
		assertNotNull(evaluation.getEvaluationType());
		assertNotNull(evaluation.getEvaluationType().getName());
		assertEquals(2, evaluation.getEvaluationType().getName().length());
		assertEquals('H', evaluation.getEvaluationType().getName().charAt(0));
	}
}