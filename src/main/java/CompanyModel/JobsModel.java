package CompanyModel;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import org.springframework.stereotype.Component;

@Component
@Entity
public class JobsModel {
    @Id
    private int jobId;
    private String jobtitle;
    private String jobPay;
    private String jobsets;
    public JobsModel(){

    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }

    public String getJobPay() {
        return jobPay;
    }

    public void setJobPay(String jobPay) {
        this.jobPay = jobPay;
    }

    public String getJobsets() {
        return jobsets;
    }

    public void setJobsets(String jobsets) {
        this.jobsets = jobsets;
    }
}
