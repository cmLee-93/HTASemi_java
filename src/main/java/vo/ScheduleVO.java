package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleVO {
	int sNumber;
	String sContents;
	String sStarDate;
	String sEndDate;
	int eNumber;
	String sType;
} 
