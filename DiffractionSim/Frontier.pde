import java.util.ArrayDeque;
class Frontier {
	private ArrayDeque<Wave> frontier;
	public Frontier() {
		frontier = new ArrayDeque<>();
	}
	int size() {
		return frontier.size();
	}
	void add (Wave newWave) {
		frontier.addLast(newWave);
	}
	Wave remove() {
		return frontier.removeFirst();
	}
}
