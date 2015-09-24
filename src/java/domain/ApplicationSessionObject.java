/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Kadin Boyle
 */
public class ApplicationSessionObject {
    
    
    public ApplicationSessionObject(){
        
    }
    
    public String isPreviousStudent;
    public String studentNumberCode;
    public String programmeName;
    public String programmeYear;
    public String programmeStudyLoad; //i.e full time, part time, undecided
    public String preferredSupervisor;
    public Map qualMap = new HashMap();

    public String getIsPreviousStudent() {
        return isPreviousStudent;
    }

    public void setIsPreviousStudent(String isPreviousStudent) {
        this.isPreviousStudent = isPreviousStudent;
    }

    public String getStudentNumberCode() {
        return studentNumberCode;
    }

    public void setStudentNumberCode(String studentNumberCode) {
        this.studentNumberCode = studentNumberCode;
    }

    public String getProgrammeName() {
        return programmeName;
    }

    public void setProgrammeName(String programmeName) {
        this.programmeName = programmeName;
    }

    public String getProgrammeYear() {
        return programmeYear;
    }

    public void setProgrammeYear(String programmeYear) {
        this.programmeYear = programmeYear;
    }

    public String getProgrammeStudyLoad() {
        return programmeStudyLoad;
    }

    public void setProgrammeStudyLoad(String load) {
        this.programmeStudyLoad = load;
    }

    public String getPreferredSupervisor() {
        return preferredSupervisor;
    }

    public void setPreferredSupervisor(String preferredSupervisor) {
        this.preferredSupervisor = preferredSupervisor;
    }

    public void addQualificationWithYear(String qual, int year) {
       qualMap.put(qual, year);
    }

    public Map getQualMap() {
        return this.qualMap;
    }

    @Override
    public String toString() {
        return "ApplicationSessionObject{" + "\n isPreviousStudent=" + isPreviousStudent + ", \n studentNumberCode=" + studentNumberCode + ", \nprogrammeName=" + programmeName + ", \n programmeYear=" + programmeYear + ", \nprogrammeStudyLoad=" + programmeStudyLoad + ", \npreferredSupervisor=" + preferredSupervisor + ", \nqualMap=" + qualMap + '}';
    }
    
    
    
}
