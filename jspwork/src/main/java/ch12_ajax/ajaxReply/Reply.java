package ch12_ajax.ajaxReply;


import java.sql.Timestamp;

public class Reply {

  private int no;
  private String content;
  private int ref;
  private String name;
  private Timestamp redate;


  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public int getRef() {
    return ref;
  }

  public void setRef(int ref) {
    this.ref = ref;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public Timestamp getRedate() {
    return redate;
  }

  public void setRedate(Timestamp redate) {
    this.redate = redate;
  }

}
