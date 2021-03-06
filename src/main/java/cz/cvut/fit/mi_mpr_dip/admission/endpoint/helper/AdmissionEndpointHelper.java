package cz.cvut.fit.mi_mpr_dip.admission.endpoint.helper;

import javax.ws.rs.core.Response;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Admission;
import cz.cvut.fit.mi_mpr_dip.admission.domain.Appendix;
import cz.cvut.fit.mi_mpr_dip.admission.domain.collection.Admissions;
import cz.cvut.fit.mi_mpr_dip.admission.endpoint.action.AdmissionAction;

public interface AdmissionEndpointHelper extends EndpointHelper<Admission> {

	public Admissions getAdmissions(Integer count, Integer page);

	public Response getAdmission(String admissionCode);

	public Response deleteAdmission(String admissionCode);

	public <T> Response mergeAdmission(String admissionCode, String baseLocation, T actor, AdmissionAction<T> action);

	public void update(Admission admission, Admission dbAdmission);

	public void validate(Admission admission);

	public void validate(Appendix appendix);

	public Admission validate(String admissionCode, Admission admission);
}
