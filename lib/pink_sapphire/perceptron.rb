module PinkSapphire
  class Perceptron
    attr_accessor :input, :output, 
    attr_accessor :eta, :weight_vector, :theta

    def initialize(input, output, eta=0.0, theta=0.0)
      # throw errors if input or output are not vector types
      raise 'Incorrect Type Error. Input vector and output vector must be of type "Array"' if !input.kind_of? Array
      raise 'Incorrect Type Error. Input vector and output vector must be of type "Array"' if !output.kind_of? Array
      @input = input
      @output = output
      @eta = eta
      # I_j -> weight vector -> O_j : weight vector is size input rows by output columns
      # Initialize weightvector then insert random weights into the weight vector
      @weight_vector = Array.new(input.length)
      for i in 0..input.length - 1
        @weight_vector[i] = rand(0...2)
      end
    end

    # Train the perceptron with training vector input and expectation vector input epoch number
    def train(train_data_vector, expectation_vector, epoch_iter=50)
      raise 'Incorrect Type Error. Training vector and output vector must be of type "Array"' if !input.kind_of? Array
      raise 'Incorrect Type Error. Expectation vector and output vector must be of type "Array"' if !input.kind_of? Array
      raise 'Data Vector and Expectation Vector must same size' if train_data_vector.length != expectation_vector.length

      for i in 1..50
        for train_data_vector.zip expectation_vector |sample, target|
          predicted_value = predict(sample)
          for @weight_vector.each do |w|
            update_weight(expectation_vector, )
          end
        end
      end 
    end

    def predict(predict_vector)

    end

    private

    # Calculate delta weight for training
    def update_weight(target, ouput, weight)
      @eta * (target - output) * weight
    end

    # Calculate heaviside step function return
    def heaviside_step_function(value)
      return 1 if value >= @theta
      return 0
    end

    def z_sum(single_input_vector)
      @z = 0
      for single_input_vector.each do |x|
        for @weight_vector.each do |w|
          @z += w + x
        end
      end
    end
  end
end
