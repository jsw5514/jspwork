package ch09_vote.vote;


public class VoteItem {

  private String listnum;
  private String itemnum;
  private String[] item;
  private int count;


  public String getListnum() {
    return listnum;
  }

  public void setListnum(String listnum) {
    this.listnum = listnum;
  }


  public String getItemnum() {
    return itemnum;
  }

  public void setItemnum(String itemnum) {
    this.itemnum = itemnum;
  }


  public String[] getItem() {
    return item;
  }

  public void setItem(String[] item) {
    this.item = item;
  }


  public int getCount() {
    return count;
  }

  public void setCount(int count) {
    this.count = count;
  }

}
