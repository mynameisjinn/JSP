package dao;

public class FeedObj {
	private String id, content, ts;
	
	public FeedObj(String id, String content, String ts) {
		this.id = id;
		this.content = content;
		this.ts = ts;
	}
	
	public String getId() {return this.id;}
	public String getContent() { return this.content;}
	public String getTs() {return this.ts;}

}
