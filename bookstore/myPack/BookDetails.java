package myPack;
/*封装书的所有信息，包括bookId,title,name,。。。。*/
public class BookDetails implements Comparable{
	private String bookId=null;
	private String title=null;    //书名
	private String name=null;    //作者名称
	private float price=0.0F;
	private int year=0;          //出场日期
	private String description=null;
	private int saleAmount;
	
	public BookDetails(String bookId,String name,String title,float price,int year,String description,int saleAmount){
		this.bookId=bookId;
		this.title=title;
		this.name=name;
		this.price=price;
		this.year=year;
		this.description=description;
		this.saleAmount=saleAmount;
	}
	
	public String getBookId(){
		return bookId;
	}
	
	public String getTitle(){
		return title;
	}
	
	public String getName(){
		return name;
	}
	
	public float getPrice(){
		return price;
	}
	
	public int getYear(){
		return year;
	}
	
	public String getDescripyion(){
		return description;
	}
	
	public int getSaleAmount(){
		return saleAmount;
	}
	
	public int compareTo(Object obj){
		BookDetails bd=(BookDetails)obj;
		int lastCmp=title.compareTo(bd.title);
		return lastCmp;
		
	}
}
