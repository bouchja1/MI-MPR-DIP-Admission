package cz.cvut.fit.mi_mpr_dip.admission.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEquals(excludeFields = { "referenceNumberTypeId", "referenceNumbers" })
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement
@RooJpaActiveRecord
public class ReferenceNumberType {
	
	@Version
	@Transient
	@XmlTransient
	private int version;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@XmlTransient
	private Long referenceNumberTypeId;

    @NotNull
    @Column(unique = true)
    private String name;
    
	@OneToMany(orphanRemoval = true, fetch = FetchType.EAGER, mappedBy = "referenceNumberType")
	@XmlTransient
	private Set<ReferenceNumber> referenceNumbers;
}