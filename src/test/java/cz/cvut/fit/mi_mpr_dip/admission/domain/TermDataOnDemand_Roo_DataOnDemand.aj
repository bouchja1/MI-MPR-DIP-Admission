// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Term;
import cz.cvut.fit.mi_mpr_dip.admission.domain.TermDataOnDemand;
import cz.cvut.fit.mi_mpr_dip.admission.domain.TermType;
import cz.cvut.fit.mi_mpr_dip.admission.domain.TermTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TermDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TermDataOnDemand: @Component;
    
    private Random TermDataOnDemand.rnd = new SecureRandom();
    
    private List<Term> TermDataOnDemand.data;
    
    @Autowired
    private TermTypeDataOnDemand TermDataOnDemand.termTypeDataOnDemand;
    
    public void TermDataOnDemand.setApologyTo(Term obj, int index) {
        Date apologyTo = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setApologyTo(apologyTo);
    }
    
    public void TermDataOnDemand.setCapacity(Term obj, int index) {
        Integer capacity = new Integer(index);
        obj.setCapacity(capacity);
    }
    
    public void TermDataOnDemand.setDateOfTerm(Term obj, int index) {
        Date dateOfTerm = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateOfTerm(dateOfTerm);
    }
    
    public void TermDataOnDemand.setRegisterFrom(Term obj, int index) {
        Date registerFrom = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRegisterFrom(registerFrom);
    }
    
    public void TermDataOnDemand.setRegisterTo(Term obj, int index) {
        Date registerTo = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRegisterTo(registerTo);
    }
    
    public void TermDataOnDemand.setRoom(Term obj, int index) {
        String room = "room_" + index;
        obj.setRoom(room);
    }
    
    public void TermDataOnDemand.setTermType(Term obj, int index) {
        TermType termType = termTypeDataOnDemand.getRandomTermType();
        obj.setTermType(termType);
    }
    
    public Term TermDataOnDemand.getSpecificTerm(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Term obj = data.get(index);
        Long id = obj.getTermId();
        return Term.findTerm(id);
    }
    
    public Term TermDataOnDemand.getRandomTerm() {
        init();
        Term obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getTermId();
        return Term.findTerm(id);
    }
    
    public boolean TermDataOnDemand.modifyTerm(Term obj) {
        return false;
    }
    
    public void TermDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Term.findTermEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Term' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Term>();
        for (int i = 0; i < 10; i++) {
            Term obj = getNewTransientTerm(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
